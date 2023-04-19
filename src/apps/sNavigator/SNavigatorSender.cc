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

    durTalk_ = 0;
    durSil_ = 0;
    selfSource_ = new cMessage("selfSource");
    scaleTalk_ = par("scale_talk");
    shapeTalk_ = par("shape_talk");
    scaleSil_ = par("scale_sil");
    shapeSil_ = par("shape_sil");
    isTalk_ = par("is_talk");
    iDtalk_ = 0;
    nframes_ = 0;
    nframesTmp_ = 0;
    iDframe_ = 0;
    timestamp_ = 0;
    size_ = par("PacketSize");
    sampling_time = par("sampling_time");
    selfSender_ = new cMessage("selfSender");
    localPort_ = par("localPort");
    destPort_ = par("destPort");
    silences_ = par("silences");
    navMessage_ = "";

    totalSentBytes_ = 0;
    warmUpPer_ = getSimulation()->getWarmupPeriod();
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

        // calculating traffic starting time
        simtime_t startTime = par("startTime");

        scheduleAt(simTime()+startTime, selfSource_);
        EV << "\t starting traffic in " << startTime << " seconds " << endl;
    }
}


void SNavigatorSender::selectPeriodTime()
{
    durTalk_ = 0.1; //Aquí cada cuanto se mandan los paquetes en segundos.
    nframes_ = 1;
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
    sNavigator->setNframes(nframes_);
    sNavigator->setIDframe(iDframe_);
    sNavigator->setPayloadTimestamp(simTime());
    sNavigator->setChunkLength(B(size_));
    sNavigator->addTag<CreationTimeTag>()->setCreationTime(simTime());

    navMessage_ = "Prueba de envío";
    sNavigator->setNavMessage(navMessage_.c_str());

    packet->insertAtBack(sNavigator);
    EV << "sNavigatorSender::sendsNavigatorPacket - Talkspurt[" << iDtalk_-1 << "] - Sending frame[" << iDframe_ << "] - MSG[[" << navMessage_ << "]\n";

    socket.sendTo(packet, destAddress_, destPort_);
    --nframesTmp_;
    ++iDframe_;

    // emit throughput sample
    totalSentBytes_ += size_;
    double interval = SIMTIME_DBL(simTime() - warmUpPer_);
    if (interval > 0.0)
    {
        double tputSample = (double)totalSentBytes_ / interval;
        emit(sNavigatorGeneratedThroughtput_, tputSample );
    }

    if (nframesTmp_ > 0)
        scheduleAt(simTime() + sampling_time, selfSender_);
}
