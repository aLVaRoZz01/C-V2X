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
package simu5g.simulations.NR.cars;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth10G;

import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Upf;
import simu5g.common.binder.Binder;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.cars.NRCar;

import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;

network Highway
{
    parameters:
        @display("bgb=5000,5000;bgu=m");

        double playgroundSizeX = 200000; // x size of the area the nodes are in (in meters)
        double playgroundSizeY = 200000; // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
    submodules:

        routingRecorder: RoutingTableRecorder {
            @display("p=109.48,2534.14;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=109.48,2584.05");
            config = xmldoc("demo.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=109.48,2687.09;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=109.48,2485.84;is=s");
        }
        binder: Binder {
            @display("p=109.48,2635.57;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=109.48,2719.29;is=s");
        }
        server: StandardHost {
            @display("p=2258.83,2880.29;is=n;i=device/server");
        }
        router: Router {
            @display("p=1788.71,2878.68;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=1083.53,2881.9");
        }
        gNodeB1: gNodeB {
            @display("p=623.07,2914.1;is=n");
        }
        gNodeB2: gNodeB {
            @display("p=623.07,3133.06;is=n");
        }
        gNodeB3: gNodeB {
            @display("p=1127,3896.2;is=vl");
        }
        gNodeB4: gNodeB {
            @display("p=1977.08,3408.37;is=vl");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("p=755.09,2622.69;i=-");
        }
    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB4.ppp;

        //# X2 connections
        gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
        gNodeB3.x2++ <--> Eth10G <--> gNodeB4.x2++;
}

