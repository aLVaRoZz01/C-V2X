// 
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa), Álvaro Rosado
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
        @display("bgb=3000,1500;bgu=m;bgi=background/ciu_wm,s");

        double playgroundSizeX = 200000; // x size of the area the nodes are in (in meters)
        double playgroundSizeY = 200000; // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
    submodules:

        routingRecorder: RoutingTableRecorder {
            @display("p=45.08,74.06;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=45.08,125.58");
            config = xmldoc("demo.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=45.08,228.62;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=45.08,27.37;is=s");
        }
        binder: Binder {
            @display("p=45.08,177.1;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=45.08,260.82;is=s");
        }
        server: StandardHost {
            @display("p=2840.04,445.97;is=n;i=device/server");
        }
        router: Router {
            @display("p=2202.48,454.02;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=1497.3,465.29");
        }
        gNodeB1: gNodeB {
            @display("p=1605.17,1362.06;is=n");
        }
        gNodeB2: gNodeB {
            @display("p=1524.67,1405.53;is=n");
        }
        gNodeB3: gNodeB {
            @display("p=2004.45,758.31;is=n");
        }
        gNodeB4: gNodeB {
            @display("p=1872.43,339.71;is=n");
        }
        gNodeB5: gNodeB {
            @display("p=2437.54,1362.06;is=n");
        }
        gNodeB6: gNodeB {
            @display("p=2590.49,1151.15;is=n");
        }
        gNodeB10: gNodeB {
            @display("p=2060.8044482726837,717.4806041867287;is=n");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("p=61.18,402.5;i=-");
        }
    connections allowunconnected:
        server.pppg++ <--> Eth10G { @display("ls=#204A87,4"); } <--> router.pppg++;
        router.pppg++ <--> Eth10G { @display("ls=#204A87,4"); } <--> upf.filterGate;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB4.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB5.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=#8AE234,2"); } <--> gNodeB6.ppp;

        //# X2 connections
//        gNodeB1.x2++ <--> Eth10G { @display("ls=#8AE234,1,da"); } <--> gNodeB2.x2++;
//        gNodeB3.x2++ <--> Eth10G { @display("ls=#8F5902,1,da"); } <--> gNodeB4.x2++;
//        gNodeB5.x2++ <--> Eth10G { @display("ls=#EF2929,1,da"); } <--> gNodeB6.x2++;

        gNodeB1.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB2.x2++;
        gNodeB1.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB3.x2++;
        gNodeB1.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB4.x2++;
        gNodeB1.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB5.x2++;
        gNodeB1.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB6.x2++;

        gNodeB2.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB1.x2++;
        gNodeB2.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB3.x2++;
        gNodeB2.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB4.x2++;
        gNodeB2.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB5.x2++;
        gNodeB2.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB6.x2++;

        gNodeB3.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB1.x2++;
        gNodeB3.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB2.x2++;
        gNodeB3.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB4.x2++;
        gNodeB3.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB5.x2++;
        gNodeB3.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB6.x2++;

        gNodeB4.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB1.x2++;
        gNodeB4.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB2.x2++;
        gNodeB4.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB3.x2++;
        gNodeB4.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB5.x2++;
        gNodeB4.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB6.x2++;

        gNodeB5.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB1.x2++;
        gNodeB5.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB2.x2++;
        gNodeB5.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB3.x2++;
        gNodeB5.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB4.x2++;
        gNodeB5.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB6.x2++;

        gNodeB6.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB1.x2++;
        gNodeB6.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB2.x2++;
        gNodeB6.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB3.x2++;
        gNodeB6.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB4.x2++;
        gNodeB6.x2++ <--> Eth10G { @display("ls=#5C3566,1,d"); } <--> gNodeB5.x2++;


}

