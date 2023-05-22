#include <cmath>
#include <inet/common/TimeTag_m.h>
#include "inet/common/INETDefs.h"
#include <omnetpp.h>

#include "SNavigatorVehicle2.h"

#define round(x) floor((x) + 0.5)

Define_Module(SNavigatorVehicle2);
using namespace std;
using namespace inet;

SNavigatorVehicle2::SNavigatorVehicle2()
{
    selfSource_ = nullptr;
    selfSender_ = nullptr;


    /////////////////////////////

    while (!mPlayoutQueue_.empty())
    {
        delete mPlayoutQueue_.front();
        mPlayoutQueue_.pop_front();
    }

    while (!mPacketsList_.empty())
    {
        delete mPacketsList_.front();
        mPacketsList_.pop_front();
    }
}

SNavigatorVehicle2::~SNavigatorVehicle2()
{
    cancelAndDelete(selfSource_);
    cancelAndDelete(selfSender_);
}

void SNavigatorVehicle2::initialize(int stage)
{
    EV << "sNavigator Sender initialize: stage " << stage << endl;

    cSimpleModule::initialize(stage);

    // avoid multiple initializations
    if (stage!=inet::INITSTAGE_APPLICATION_LAYER)
        return;


    selfSource_ = new cMessage("selfSource");
    iDtalk_ = 0;
    timestamp_ = 0;
    size_ = par("PacketSize");
    selfSender_ = new cMessage("selfSender");
    localPort_ = par("localPort");
    destPort_ = par("destPort");
    navMessage_ = "";

    totalSentBytes_ = 0;
    sNavigatorGeneratedThroughtput_ = registerSignal("sNavigatorGeneratedThroughput");

    initTraffic_ = new cMessage("initTraffic");
    initTraffic();


    //////////////////////////


    if (stage != inet::INITSTAGE_APPLICATION_LAYER)
        return;


    mInit_ = true;

//    int port = par("localPort");
//    EV << "sNavigatorReceiver::initialize - binding to port: local:" << port << endl;
//    if (port != -1)
//    {
//        socket.setOutputGate(gate("socketOut"));
//        socket.bind(port);
//    }
//
    totalRcvdBytes_ = 0;

    mobility = VeinsInetMobilityAccess().get(getParentModule());
    traci = mobility->getCommandInterface();
    traciVehicle = mobility->getVehicleCommandInterface();
    carId=mobility->getExternalId();

}

void SNavigatorVehicle2::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage())
    {
        if (!strcmp(msg->getName(), "selfSender"))
            sendsNavigatorPacket();
        else if (!strcmp(msg->getName(), "selfSource"))
            selectPeriodTime();
        else
            initTraffic();
    }

    /////////////////////////////////////////////////////////////////

    if (msg->isSelfMessage())
        return;

    Packet* pPacket = dynamic_cast<Packet*>(msg);
    if (pPacket == nullptr) {
        return;
        throw cRuntimeError("sNavigatorReceiver::handleMessage - FATAL! Error when casting to inet packet");
    }

    // read sNavigator header
    auto sNavigatorHeader = pPacket->popAtFront<SNavigatorPacket2>();

    if (mInit_)
    {
        mCurrentTalkspurt_ = sNavigatorHeader->getIDtalk();
        mInit_ = false;
    }

    if (mCurrentTalkspurt_ != sNavigatorHeader->getIDtalk())
    {
        mCurrentTalkspurt_ = sNavigatorHeader->getIDtalk();
    }

    //Procesa el paquete navigator para cambiar la ruta
    std::string strRoutes = sNavigatorHeader->getNavMessage();
    std::string filter = "No cambies de ruta:";
    if (strRoutes.substr(0, filter.length()) == filter) {

    }
    else {
        std::stringstream ss(strRoutes);
        std:list<std::string> routesList;

        std::string substr;
        while (std::getline(ss, substr, ',')) {
            routesList.push_back(substr);
        }

        EV <<  "Cambiando ruta :)" << endl;
        if (simTime()>35)
            traciVehicle->changeVehicleRoute(routesList);
    }



    // emit throughput sample
    totalRcvdBytes_ += (int)B(sNavigatorHeader->getChunkLength()).get();

    auto packetToBeQueued = sNavigatorHeader->dup();
    mPacketsList_.push_back(packetToBeQueued);

    delete pPacket;

}

void SNavigatorVehicle2::initTraffic()
{
    std::string destAddress = par("destAddress").stringValue();
    cModule* destModule = findModuleByPath(par("destAddress").stringValue());
    if (destModule == nullptr)
    {
        // this might happen when users are created dynamically
        EV << simTime() << "sNavigatorSender::initTraffic - destination " << destAddress << " not found" << endl;

        simtime_t offset = 0.01; // TODO check value
        scheduleAt(simTime()+offset, initTraffic_);
        EV << simTime() << "sNavigatorSender::initTraffic - the node will retry to initialize traffic in " << offset << " seconds " << endl;
    }
    else
    {
        delete initTraffic_;

        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort_);

        int tos = par("tos");
        if (tos != -1)
            socket.setTos(tos);

        EV << simTime() << "sNavigatorSender::initialize - binding to port: local:" << localPort_ << " , dest: " << destAddress_.str() << ":" << destPort_ << endl;

        scheduleAt(simTime(), selfSource_);
    }
}


void SNavigatorVehicle2::selectPeriodTime()
{
    durTalk_ = 0.1; //Aquí cada cuanto se mandan los paquetes en segundos.
    scheduleAt(simTime() + durTalk_, selfSource_);
    scheduleAt(simTime(), selfSender_);
}

void SNavigatorVehicle2::sendsNavigatorPacket()
{
    if (destAddress_.isUnspecified())
        destAddress_ = L3AddressResolver().resolve(par("destAddress"));

    Packet* packet = new inet::Packet("sNavigator");
    auto sNavigator = makeShared<SNavigatorPacket2>();
    sNavigator->setIDtalk(iDtalk_ - 1);
    sNavigator->setChunkLength(B(size_));
    sNavigator->addTag<CreationTimeTag>()->setCreationTime(simTime());


    //navMessage_ = "Servidor dame una ruta por favor";
//    std::string mensajes[] = {
//        "Fernando en la curva 3",
//        "Lo primero de todo como están los maquinas",
//        "Paso que tengo prisa",
//        "Písale vamos",
//        "Dame una rutilla server que me voy de curvas",
//        "Que tal ha ido el tramo",
//        "Rotonda sin fuente..."
//    };
//
//
//
//    int num_mensajes = sizeof(mensajes) / sizeof(mensajes[0]);
//    int indice_aleatorio = rand() % num_mensajes;
//
//    sNavigator->setNavMessage(mensajes[indice_aleatorio].c_str());
    //sNavigator->setNavMessage(navMessage_.c_str());

    std::list<std::string> lista = traciVehicle->getPlannedRoadIds();
    // traciVehicle->getRoadId() // Para obtener la carretera en la que se encuentra actualmente

    std::string resultado;

        for (auto it = lista.begin(); it != lista.end(); ++it) {
            resultado += *it;

            // Agregar una coma después de cada elemento, excepto el último
            if (std::next(it) != lista.end()) {
                resultado += ",";
            }
        }
    sNavigator->setNavMessage(resultado.c_str());


    packet->insertAtBack(sNavigator);
    EV << "sNavigatorSender::sendsNavigatorPacket - Talkspurt[" << iDtalk_-1 << "] - MSG[[" << navMessage_ << "]\n";

    socket.sendTo(packet, destAddress_, destPort_);

    // emit throughput sample
    totalSentBytes_ += size_;

}
