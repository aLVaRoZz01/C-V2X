/*
 * serverNavigatorReceiver.cc
 *
 *  Created on: Feb 28, 2023
 *      Author: simu5g
 */

#include "../serverNavigator/serverNavigatorReceiver.h"

#include "inet/applications/base/ApplicationPacket_m.h"
#include "inet/common/packet/Packet.h"
#include "inet/common/ModuleAccess.h"
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "inet/transportlayer/contract/udp/UdpSocket.h"

using namespace std;
using namespace inet;

Define_Module(serverNavigatorReceiver);

void serverNavigatorReceiver::initialize(int stage)
{
    if (stage == INITSTAGE_LOCAL) {
        udpSocket.setOutputGate(gate("socketOut"));
        udpSocket.bind(port);
        udpSocket.setBroadcast(false);

        // Configura la dirección del servidor
        destAddr = Ipv4Address(par("serverAddr").stringValue());
        destPort = par("serverPort");

        // Registra la recepción de paquetes
        udpSocket.setCallback(this);

        // Programa la recepción de paquetes
        scheduleAt(simTime() + par("waitTime").doubleValue(), &selfMsg);
    }
}

void serverNavigatorReceiver::handleMessage(cMessage *msg)
{

            auto packet = check_and_cast<Packet*>(msg);
            auto appPacket = packet->peekAtFront<ApplicationPacket>();
            string strData = appPacket->printToString();
            EV_INFO << "Cliente recibió respuesta del servidor: " << strData << std::endl;
            // eliminar el paquete
            delete packet;


}

void serverNavigatorReceiver::socketDataArrived(UdpSocket *socket, Packet *packet)
{
    // Lee el mensaje recibido del servidor
    auto payload = packet->peekData();
    EV_INFO << "Received packet: " << payload << endl;

    // Libera el paquete
    delete packet;
}






