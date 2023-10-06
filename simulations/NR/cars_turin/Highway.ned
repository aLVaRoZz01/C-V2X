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

package simu5g.simulations.NR.cars_turin;

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

import org.car2x.veins.modules.obstacle.ObstacleControl;

import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
import org.car2x.veins.modules.world.annotations.AnnotationManager;
import org.car2x.veins.visualizer.roads.RoadsCanvasVisualizer;

network Highway
{
    parameters:
        double playgroundSizeX @unit(m); // x size of the area the nodes are in (in meters)
        double playgroundSizeY @unit(m); // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
        @display("bgb=7441.973,5672.4653");
        double width = 0.69669; // Coloca el ancho en metros
        double height = 0.150593; // Coloca el alto en metros


    submodules:
        annotations: AnnotationManager {
            @display("p=260,50");
        }
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=300,0");
        }
        
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("demo.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=50,227;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        binder: Binder {
            @display("p=50,175;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=50.993748,258.7;is=s");
        }
        server: StandardHost {
            @display("p=2754.994,122.52668;is=n;i=device/server");
        }
        router: Router {
            @display("p=2383.701,129.95253;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=1889.8812,122.52668");
        }
        gNodeB1: gNodeB {
            @display("p=620.05927,452.97742;is=vl");
        }
        gNodeB2: gNodeB {
            @display("p=2435.682,631.19806;is=vl");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("is=vs;p=23,313");
        }
        gNodeB3: gNodeB {
            @display("p=293.32144,1280.9607;is=vl");
        }
        gNodeB4: gNodeB {
            @display("p=1377.497,1210.415;is=vl");
        }
        gNodeB5: gNodeB {
            @display("p=2435.682,1815.6226;is=vl");
        }
        gNodeB6: gNodeB {
            @display("p=614.93536,2089.5254;is=vl");
        }
        gNodeB7: gNodeB {
            @display("p=539.63715,3262.9224;is=vl");
        }
        gNodeB8: gNodeB {
            @display("p=1556.163,2867.6067;is=vl");
        }
        gNodeB9: gNodeB {
            @display("p=1242.4204,4266.8984;is=vl");
        }
        gNodeB10: gNodeB {
            @display("p=2434.642,3733.5361;is=vl");
        }
        gNodeB11: gNodeB {
            @display("p=3513.9165,3149.975;is=vl");
        }
        gNodeB12: gNodeB {
            @display("p=3513.9165,1706.7594;is=vl");
        }
        gNodeB13: gNodeB {
            @display("p=4185.3257,520.8126;is=vl");
        }
        gNodeB14: gNodeB {
            @display("p=6061.506,520.8126;is=vl");
        }
        gNodeB15: gNodeB {
            @display("p=5101.4536,1706.7594;is=vl");
        }
        gNodeB16: gNodeB {
            @display("p=4762.612,2861.332;is=vl");
        }
        gNodeB17: gNodeB {
            @display("p=4379.8457,4266.8984;is=vl");
        }
        gNodeB18: gNodeB {
            @display("p=5603.442,1706.7594;is=vl");
        }
        gNodeB19: gNodeB {
            @display("p=6105.4297,2861.332;is=vl");
        }
        gNodeB20: gNodeB {
            @display("p=6368.9736,4041.004;is=vl");
        }
    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB4.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB5.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB6.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB7.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB8.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB9.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB10.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB11.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB12.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB13.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB14.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB15.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB16.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB17.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB18.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB19.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB20.ppp;

        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

