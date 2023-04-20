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

#include "apps/sNavigator/SNavigatorReceiver.h"

Define_Module(SNavigatorReceiver);

using namespace std;
using namespace inet;

SNavigatorReceiver::~SNavigatorReceiver()
{
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

void SNavigatorReceiver::initialize(int stage)
{
    if (stage != inet::INITSTAGE_APPLICATION_LAYER)
        return;


    mInit_ = true;

    int port = par("localPort");
    EV << "sNavigatorReceiver::initialize - binding to port: local:" << port << endl;
    if (port != -1)
    {
        socket.setOutputGate(gate("socketOut"));
        socket.bind(port);
    }

    totalRcvdBytes_ = 0;

}

void SNavigatorReceiver::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage())
        return;
    Packet* pPacket = check_and_cast<Packet*>(msg);

    if (pPacket == 0)
    {
        throw cRuntimeError("sNavigatorReceiver::handleMessage - FATAL! Error when casting to inet packet");
    }

    // read sNavigator header
    auto sNavigatorHeader = pPacket->popAtFront<SNavigatorPacket>();

    if (mInit_)
    {
        mCurrentTalkspurt_ = sNavigatorHeader->getIDtalk();
        mInit_ = false;
    }

    if (mCurrentTalkspurt_ != sNavigatorHeader->getIDtalk())
    {
        mCurrentTalkspurt_ = sNavigatorHeader->getIDtalk();
    }

    EV << "sNavigatorReceiver::handleMessage - Packet received: TALK[" << sNavigatorHeader->getIDtalk() << "] - SIZE[ " << sNavigatorHeader->getChunkLength() << " bytes]" " - MSG[" << sNavigatorHeader->getNavMessage() << "]\n";

    // emit throughput sample
    totalRcvdBytes_ += (int)B(sNavigatorHeader->getChunkLength()).get();

    auto packetToBeQueued = sNavigatorHeader->dup();
    mPacketsList_.push_back(packetToBeQueued);

    delete pPacket;
}



