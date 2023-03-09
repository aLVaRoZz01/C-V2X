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

using namespace omnetpp;
using namespace inet;

class serverNavigatorSender : public cSimpleModule, public UdpSocket::ICallback
{
  protected:
    UdpSocket udpSocket;
    int localPort;
    cMessage selfMsg;
    int seq;

  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void socketDataArrived(UdpSocket *socket, Packet *packet) override;
};




#endif /* APPS_SERVERNAVIGATOR_SERVERNAVIGATORSENDER_H_ */
