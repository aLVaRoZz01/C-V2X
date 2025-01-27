//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
//

#include <cmath>
#include <inet/common/TimeTag_m.h>
#include "CbrSender.h"
#include <set>

#define round(x) floor((x) + 0.5)

Define_Module(CbrSender);
using namespace inet;
using namespace std;

simsignal_t CbrSender::cbrGeneratedThroughtputSignal_ = registerSignal("cbrGeneratedThroughtputSignal");
simsignal_t CbrSender::cbrGeneratedBytesSignal_ = registerSignal("cbrGeneratedBytesSignal");
simsignal_t CbrSender::cbrSentPktSignal_ = registerSignal("cbrSentPktSignal");

std::set<std::string> CbrSender::processedVehicles;

CbrSender::CbrSender()
{
    initialized_ = false;
    selfSource_ = nullptr;
    selfSender_ = nullptr;
}

CbrSender::~CbrSender()
{
    cancelAndDelete(selfSource_);
}

void CbrSender::initialize(int stage)
{

    cSimpleModule::initialize(stage);
    EV << "CBR Sender initialize: stage " << stage << " - initialize=" << initialized_ << endl;

    if (stage == INITSTAGE_LOCAL)
    {
        selfSource_ = new cMessage("selfSource");
        nframes_ = 0;
        nframesTmp_ = 0;
        iDframe_ = 0;
        timestamp_ = 0;
        size_ = par("PacketSize");
        sampling_time = par("sampling_time");
        localPort_ = par("localPort");
        destPort_ = par("destPort");

        txBytes_ = 0;

    }
    else if (stage == INITSTAGE_APPLICATION_LAYER)
    {
        // calculating traffic starting time
        startTime_ = par("startTime");
        finishTime_ = par("finishTime");

        EV << " finish time " << finishTime_ << endl;
        nframes_ = (finishTime_ - startTime_) / sampling_time;

        initTraffic_ = new cMessage("initTraffic");
        initTraffic();
    }

    try{
        mobility = VeinsInetMobilityAccess().get(getParentModule());
        traci = mobility->getCommandInterface();
        traciVehicle = mobility->getVehicleCommandInterface();
        carId=mobility->getExternalId();

        std::string road = traciVehicle->getRoadId().c_str();
        std::string vehID = carId.c_str();

        cModule *currentModule = getParentModule();
        std::string moduleName = currentModule->getFullPath();
        size_t lastDotPos = moduleName.find_last_of('.');
        std::string carPart = (lastDotPos != std::string::npos)
                                  ? moduleName.substr(lastDotPos + 1)
                                  : moduleName;


        if (processedVehicles.empty())
        {
            std::string filePath = "/home/alvaro/simu5g-workspace/simu5G/simulations/NR/cars_turin/results/posiciones.txt";
            if (std::remove(filePath.c_str()) == 0)
            {
                EV << "Archivo borrado porque processedVehicles estaba vacío." << endl;
            }
            else
            {
                EV << "El archivo no existía o no se pudo borrar." << endl;
            }
        }

        if (processedVehicles.find(vehID) == processedVehicles.end())
        {
            processedVehicles.insert(vehID);

            std::ofstream outputFile;
            outputFile.open("/home/alvaro/simu5g-workspace/simu5G/simulations/NR/cars_turin/results/posiciones.txt", std::ios::app);
            if (outputFile.is_open())
            {
                outputFile << "OMNET-" << carPart << " - SUMO-car[" << vehID <<"]: " << road << "\n";
                outputFile.close();
            }
            else
            {
                EV << "Error al abrir el archivo para escribir las posiciones." << endl;
            }
        }
    }
    catch(const std::runtime_error &e){}
}

void CbrSender::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage())
    {
        if (!strcmp(msg->getName(), "selfSource"))
        {
            EV << "CbrSender::handleMessage - now[" << simTime() << "] <= finish[" << finishTime_ <<"]" <<endl;
            if( simTime() <= finishTime_ || finishTime_ == 0 )
                sendCbrPacket();
        }
        else
            initTraffic();
    }
}

void CbrSender::initTraffic()
{
    std::string destAddress = par("destAddress").stringValue();
    cModule* destModule = findModuleByPath(par("destAddress").stringValue());
    if (destModule == nullptr)
    {
        // this might happen when users are created dynamically
        EV << simTime() << "CbrSender::initTraffic - destination " << destAddress << " not found" << endl;

        simtime_t offset = 0.01; // TODO check value
        scheduleAt(simTime()+offset, initTraffic_);
        EV << simTime() << "CbrSender::initTraffic - the node will retry to initialize traffic in " << offset << " seconds " << endl;
    }
    else
    {
        delete initTraffic_;

        destAddress_ = inet::L3AddressResolver().resolve(par("destAddress").stringValue());
        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort_);

        int tos = par("tos");
        if (tos != -1)
            socket.setTos(tos);

        EV << simTime() << "CbrSender::initialize - binding to port: local:" << localPort_ << " , dest: " << destAddress_.str() << ":" << destPort_ << endl;

        // calculating traffic starting time
        simtime_t startTime = par("startTime");

        scheduleAt(simTime()+startTime, selfSource_);
        EV << "\t starting traffic in " << startTime << " seconds " << endl;
    }
}

void CbrSender::sendCbrPacket()
{
    Packet* packet = new Packet("CBR");
    auto cbr = makeShared<CbrPacket>();
    cbr->setNframes(nframes_);
    cbr->setIDframe(iDframe_++);
    cbr->setPayloadTimestamp(simTime());
    cbr->setPayloadSize(size_);
    cbr->setChunkLength(B(size_));
    cbr->addTag<CreationTimeTag>()->setCreationTime(simTime());
    packet->insertAtBack(cbr);

    emit(cbrGeneratedBytesSignal_,size_);

    if( simTime() > getSimulation()->getWarmupPeriod() )
    {
        txBytes_ += size_;
    }
    socket.sendTo(packet, destAddress_, destPort_);

    scheduleAt(simTime() + sampling_time, selfSource_);
}

void CbrSender::finish()
{
    simtime_t elapsedTime = simTime() - getSimulation()->getWarmupPeriod();
    emit( cbrGeneratedThroughtputSignal_, txBytes_ / elapsedTime.dbl() );
}
