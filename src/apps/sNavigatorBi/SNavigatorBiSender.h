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

#ifndef _SNAVIGATORBISENDER_H_
#define _SNAVIGATORBISENDER_H_

#include <string.h>
#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>
#include "apps/sNavigatorBi/SNavigatorBiPacket_m.h"

class SNavigatorBiSender : public omnetpp::cSimpleModule
{
    inet::UdpSocket socket;

    //source
    omnetpp::simtime_t durTalk_;
    omnetpp::cMessage* selfSource_;
    //sender
    int iDtalk_;
    int size_;
    std::string navMessage_;


    unsigned int totalSentBytes_;

    omnetpp::simsignal_t sNavigatorGeneratedThroughtput_;
    // ----------------------------

    omnetpp::cMessage *selfSender_;

    omnetpp::cMessage *initTraffic_;

    omnetpp::simtime_t timestamp_;
    int localPort_;
    int destPort_;
    inet::L3Address destAddress_;

    void initTraffic();
    void selectPeriodTime();
    void sendsNavigatorBiPacket();

  public:
    ~SNavigatorBiSender();
    SNavigatorBiSender();

  protected:

    virtual int numInitStages() const  override { return inet::NUM_INIT_STAGES; }
    void initialize(int stage) override;
    void handleMessage(omnetpp::cMessage *msg) override;

};

#endif

