/*
 * serverNavigatorSender.cc
 *
 *  Created on: Feb 28, 2023
 *      Author: simu5g
 */

#include "apps/serverNavigator/serverNavigatorSender.h"
#include "inet/applications/base/ApplicationPacket_m.h"
#include "inet/common/packet/Packet.h"
#include "inet/common/ModuleAccess.h"
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "inet/transportlayer/contract/udp/UdpSocket.h"

using namespace std;
using namespace inet;

Define_Module(serverNavigatorSender);

void serverNavigatorSender::initialize(int stage)
{
    if (stage == INITSTAGE_LOCAL) {
        udpSocket.setOutputGate(gate("socketOut"));
        udpSocket.bind(par("destPort"));

        // Genera el mensaje a enviar al cliente
        string msgToSend = "Hola, coche!";

        // Programa un temporizador para enviar el mensaje en un momento aleatorio
        scheduleAt(simTime() + par("waitTime").doubleValue(), &selfMsg);
    }
}

void serverNavigatorSender::handleMessage(cMessage *msg)
{
    if (msg == &selfMsg) {
        // Crea un paquete con el mensaje a enviar al cliente
        Packet *packet = new Packet("msg");
        auto payload = makeShared<ApplicationPacket>();
        payload->setSequenceNumber(seq++);
        payload->setPayload("Hola, coche!".c_str());
        packet->insertAtBack(payload);

        // Envía el paquete al cliente utilizando el protocolo UDP
        udpSocket.sendTo(packet, par("destAddress"), par("destPort"));

        // Programa el próximo envío de mensaje
        scheduleAt(simTime() + par("waitTime").doubleValue(), &selfMsg);
    }
    else {
        delete msg;
    }
}





