/*
 * serverNavigatorSender.h
 *
 *  Created on: Feb 28, 2023
 *      Author: simu5g
 */

#ifndef APPS_SERVERNAVIGATOR_SERVERNAVIGATORSENDER_H_
#define APPS_SERVERNAVIGATOR_SERVERNAVIGATORSENDER_H_


#include <omnetpp.h>
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "inet/transportlayer/contract/udp/UdpSocket.h"

#include "veins/modules/mobility/traci/TraCIMobility.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins_inet/VeinsInetMobility.h"

using namespace omnetpp;
using namespace inet;
using namespace std;
using namespace veins;

class VEINS_API serverNavigatorSender : public omnetpp::cSimpleModule, public cListener, public UdpSocket::ICallback
{
  protected:
    UdpSocket udpSocket;
    int localPort;
    cMessage selfMsg;
    int seq;

  public:


  protected:
    void initialize(int stage) override;
    void handleMessage(cMessage *msg) override;
    void socketDataArrived(UdpSocket *socket, Packet *packet) override;

    virtual void socketErrorArrived(UdpSocket *socket, Indication *indication) override {return;}
    virtual void socketClosed(UdpSocket *socket) override {return;}
};




#endif /* APPS_SERVERNAVIGATOR_SERVERNAVIGATORSENDER_H_ */
