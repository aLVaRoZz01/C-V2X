/*
 * serverNavigatorReceiver.h
 *
 *  Created on: Feb 28, 2023
 *      Author: simu5g
 */

#ifndef APPS_SERVERNAVIGATOR_SERVERNAVIGATORRECEIVER_H_
#define APPS_SERVERNAVIGATOR_SERVERNAVIGATORRECEIVER_H_


#include <omnetpp.h>
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "inet/transportlayer/contract/udp/UdpSocket.h"
#include <inet/applications/base/ApplicationBase.h>
#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/applications/base/ApplicationPacket_m.h>

using namespace omnetpp;
using namespace inet;

class serverNavigatorReceiver : public cSimpleModule, public UdpSocket::ICallback
{
  protected:
    UdpSocket udpSocket;
    Ipv4Address destAddr;
    int destPort;
    int port;
    cMessage selfMsg;
    int seq;

  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg); //override;
    virtual void socketDataArrived(UdpSocket *socket, Packet *packet) override;
};




#endif /* APPS_SERVERNAVIGATOR_SERVERNAVIGATORRECEIVER_H_ */
