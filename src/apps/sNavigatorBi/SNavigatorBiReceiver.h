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

#ifndef _LTE_SNAVIGATORBIRECEIVER_H_
#define _LTE_SNAVIGATORBIRECEIVER_H_

#include <list>
#include <string.h>

#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>

#include "apps/sNavigatorBi/SNavigatorBiPacket_m.h"

#include "veins/modules/mobility/traci/TraCIMobility.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins_inet/VeinsInetMobility.h"

using veins::VeinsInetMobility;


using namespace std;
using namespace inet;
using namespace veins;

class SNavigatorBiReceiver : public omnetpp::cSimpleModule
{
    inet::UdpSocket socket;

    ~SNavigatorBiReceiver();

    typedef std::list<SNavigatorBiPacket*> PacketsList;
    PacketsList mPacketsList_;
    PacketsList mPlayoutQueue_;
    unsigned int mCurrentTalkspurt_;

    bool mInit_;

    unsigned int totalRcvdBytes_;
    omnetpp::simtime_t warmUpPer_;

protected:
    /* pointers ill be set when used with TraCIMobility */
    VeinsInetMobility* mobility;
    TraCICommandInterface* traci;
    TraCICommandInterface::Vehicle* traciVehicle;
    std::string carId; // this vehicle

  protected:

    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    void initialize(int stage) override;
    void handleMessage(omnetpp::cMessage *msg) override;
};

#endif

