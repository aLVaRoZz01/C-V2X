//
// Copyright (C) 2006-2011 Christoph Sommer <christoph.sommer@uibk.ac.at>
//
// Documentation for these modules is at http://veins.car2x.org/
//
// SPDX-License-Identifier: GPL-2.0-or-later
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

#ifndef _LTE_NAVIGATOR_H_
#define _LTE_NAVIGATOR_H_


#include <list>
#include <string.h>

#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>



#include "veins/modules/mobility/traci/TraCIMobility.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins_inet/VeinsInetMobility.h"

using veins::VeinsInetMobility;


using namespace std;
using namespace inet;
using namespace veins;

class VEINS_API Navigator : public omnetpp::cSimpleModule, public cListener {

public:

    void initialize(int stage) override;

    void receiveSignal(cComponent* source, simsignal_t signalID, cObject* obj, cObject* details) override;


protected:
    /* pointers ill be set when used with TraCIMobility */
    VeinsInetMobility* mobility;
    TraCICommandInterface* traci;
    TraCICommandInterface::Vehicle* traciVehicle;
    std::string carId; // this vehicle

protected:

    /** @brief this function is called every time the vehicle receives a position update signal */
    void handlePositionUpdate(cObject* obj);

    /** isoto: copied from FindModule.h
     * @brief Returns a pointer to the host module of the passed module.
     *
     * Assumes that every host module is a direct sub module of the
     * simulation.
     */
     static cModule* const findHost(cModule* const m)
     {
       cModule* parent = m != nullptr ? m->getParentModule() : nullptr;
       cModule* node = m;

       // all nodes should be a sub module of the simulation which has no parent module!!!
       while (parent != nullptr && parent->getParentModule() != nullptr) {
          node = parent;
          parent = node->getParentModule();
       }
       return node;
     }
};


#endif
