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
#include "apps/sNavigator/SNavigatorSender.h"

#define round(x) floor((x) + 0.5)

Define_Module(SNavigatorSender);
using namespace inet;

SNavigatorSender::SNavigatorSender()
{
    selfSource_ = nullptr;
    selfSender_ = nullptr;
}

SNavigatorSender::~SNavigatorSender()
{
    cancelAndDelete(selfSource_);
    cancelAndDelete(selfSender_);
}

void SNavigatorSender::initialize(int stage)
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
}

void SNavigatorSender::handleMessage(cMessage *msg)
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
}

void SNavigatorSender::initTraffic()
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


void SNavigatorSender::selectPeriodTime()
{
    durTalk_ = 0.1; //Aquí cada cuanto se mandan los paquetes en segundos.
    scheduleAt(simTime() + durTalk_, selfSource_);
    scheduleAt(simTime(), selfSender_);
}

void SNavigatorSender::sendsNavigatorPacket()
{
    if (destAddress_.isUnspecified())
        destAddress_ = L3AddressResolver().resolve(par("destAddress"));

    Packet* packet = new inet::Packet("sNavigator");
    auto sNavigator = makeShared<SNavigatorPacket>();
    sNavigator->setIDtalk(iDtalk_ - 1);
    sNavigator->setChunkLength(B(size_));
    sNavigator->addTag<CreationTimeTag>()->setCreationTime(simTime());


    std::list<std::string> roads {
                                "1/1to1/0",
                                "1/0to0/0"
                            };
    std::string result;
    for (const auto& road : roads) {
        result += road + ",";
    }
    if(!result.empty()){
        result.pop_back();
    }

    navMessage_ = result;
    sNavigator->setNavMessage(navMessage_.c_str());

    packet->insertAtBack(sNavigator);
    EV << "sNavigatorSender::sendsNavigatorPacket - Talkspurt[" << iDtalk_-1 << "] - MSG[[" << navMessage_ << "]\n";

    socket.sendTo(packet, destAddress_, destPort_);

    // emit throughput sample
    totalSentBytes_ += size_;

}
