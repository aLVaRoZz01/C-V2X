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



#include "apps/navigator/Navigator.h"

//#include "apps/navigator/NavigatorMessage_m.h"

using namespace std;
using namespace inet;

Define_Module(Navigator);

void Navigator::initialize(int stage)
{
    if (stage == 0) {

        // initialize pointers to other modules
     if (FindModule<VeinsInetMobility*>::findSubModule(getParentModule())) {
        mobility = VeinsInetMobilityAccess().get(getParentModule());
        traci = mobility->getCommandInterface();
        traciVehicle = mobility->getVehicleCommandInterface();
        carId=mobility->getExternalId();
     }
     else {
        traci = nullptr;
        mobility = nullptr;
        traciVehicle = nullptr;
     }
     findHost(this)->subscribe(VeinsInetMobility::mobilityStateChangedSignal, this);


    }
}


//void Navigator::handlePositionUpdate(cObject* obj)
//{
//
//    /* isoto:
//     * Commands of TraCICommandInterface::Vehicle available at:
//     * veins-veins-5.2/src/veins/modules/mobility/traci/TraCIMobilityInterface.h y .cc
//     * access through 'traciVehicle'
//     *
//     * Commands of VeinsInetMobility available at:
//     * veins_inet/src/veins_inet/VeinsInetMobility.h y .cc
//     * access through 'mobility'
//     *
//     */
//    EV_INFO << "Entrando en handlePositionUpdate, la velocidad del coche " << carId << " es " << /*mobility->getCurrentVelocity()*/traciVehicle->getSpeed() << endl;
//    char *vehicle = "7";
//     /* We stop vehicle 7 at 50s and restart it again at 65s */
//    if ((carId==vehicle)&&(simTime()==50)) {
//        traciVehicle->setSpeed(0);
//        EV_INFO << "Paramos vehículo " << carId << " a los " << simTime() << " segundos" << endl;
//    }
//    if ((carId==vehicle)&&(simTime()==65)) {
//            traciVehicle->setSpeed(15);
//            EV_INFO << "Arrancamos vehículo " << carId << " a los " << simTime() << " segundos" << endl;
//    }
//}

void Navigator::handlePositionUpdate(cObject* obj)
{


    char *vehicle = "0";
    std::string routeId_r;
    std::list<std::string> roads {
                            "1/1to1/0",
                            "1/0to0/0"
                        };
    if ((carId==vehicle)&&(simTime()==35)) {
        traciVehicle->changeVehicleRoute(roads);
        routeId_r = traciVehicle->getRouteId();
        EV_INFO << "la ruta del vehículo con id: " << carId << " es: " << routeId_r << endl;

    }


}




void Navigator::receiveSignal(cComponent* source, simsignal_t signalID, cObject* obj, cObject* details)
{
    Enter_Method_Silent();
    if (signalID == VeinsInetMobility::mobilityStateChangedSignal) {
        handlePositionUpdate(obj);
    }
}
