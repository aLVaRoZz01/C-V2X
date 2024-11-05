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

package simu5g.simulations.NR.tfm_test;

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
        @display("bgb=3200,3200,,,0");
        double width = 10886.92; // Coloca el ancho en metros
        double height = 11931.58; // Coloca el alto en metros


    submodules:
        annotations: AnnotationManager {
            @display("p=2722.3198,4817.155");
        }
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=248.14523,4825.046");
        }

        routingRecorder: RoutingTableRecorder {
            @display("p=248.14523,5624.625;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=762.63574,4821.9814");
            config = xmldoc("ipv4config.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=1119.8196,4821.9814;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=1559.0591,4821.9814;is=s");
        }
        binder: Binder {
            @display("p=2012.779,4821.9814;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=2263.7732,4821.9814;is=s");
        }
        server: StandardHost {
            @display("p=1887.2821,183.41872;is=n;i=device/server");
        }
        router: Router {
            @display("p=1563.8859,178.5919;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=1269.4506,183.41872");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("is=vs;p=2172.0637,183.41872");
        }


        gNodeB1: gNodeB {
            @display("p=1203.90434,849.28249;is=vs");
        }
        





    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;

        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB1.ppp;
        

        



        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

