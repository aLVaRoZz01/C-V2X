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
        @display("bgb=10886.92,11931.58,,,0");
        double width = 10886.92; // Coloca el ancho en metros
        double height = 11931.58; // Coloca el alto en metros


    submodules:
        annotations: AnnotationManager {
            @display("p=260,50");
        }
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=248.14523,4825.046");
        }

        routingRecorder: RoutingTableRecorder {
            @display("p=248.14523,5624.625;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=248.14523,3901.3943");
            config = xmldoc("ipv4config.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=248.14523,3184.5305;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=275.71692,2564.1672;is=s");
        }
        binder: Binder {
            @display("p=289.50278,1957.5901;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=248.14523,840.9366;is=s");
        }
        server: StandardHost {
            @display("p=9939.595,565.21967;is=n;i=device/server");
        }
        router: Router {
            @display("p=8064.7197,551.43384;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=5652.197,565.21967");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("is=vs;p=248.14523,1268.2979");
        }


        gNodeB1: gNodeB {
            @display("p=3937.05512,4451.89499;is=vs");
        }
        gNodeB2: gNodeB {
            @display("p=4308.39929,8120.49015;is=vs");
        }
        gNodeB3: gNodeB {
            @display("p=2456.29601,4070.76169;is=vs");
        }
        gNodeB4: gNodeB {
            @display("p=3764.86941,8263.98593;is=vs");
        }
        gNodeB5: gNodeB {
            @display("p=2652.90570,4277.56604;is=vs");
        }
        gNodeB6: gNodeB {
            @display("p=3764.86941,8263.98593;is=vs");
        }
        gNodeB7: gNodeB {
            @display("p=6770.91535,3125.44681;is=vs");
        }
        gNodeB8: gNodeB {
            @display("p=5347.81890,4170.21838;is=vs");
        }
        gNodeB9: gNodeB {
            @display("p=4938.15036,2790.02774;is=vs");
        }
        gNodeB10: gNodeB {
            @display("p=7148.15052,4595.12568;is=vs");
        }
        gNodeB11: gNodeB {
            @display("p=4274.21348,3694.54710;is=vs");
        }
        gNodeB12: gNodeB {
            @display("p=3731.05462,3838.03472;is=vs");
        }
        gNodeB13: gNodeB {
            @display("p=6432.48371,2662.08718;is=vs");
        }
        gNodeB14: gNodeB {
            @display("p=4512.46362,1709.45852;is=vs");
        }
        gNodeB15: gNodeB {
            @display("p=7386.08740,3969.62356;is=vs");
        }
        gNodeB16: gNodeB {
            @display("p=3522.52536,3376.72350;is=vs");
        }
        gNodeB17: gNodeB {
            @display("p=3947.29702,3841.66792;is=vs");
        }
        gNodeB18: gNodeB {
            @display("p=6748.47570,4498.45853;is=vs");
        }
        gNodeB19: gNodeB {
            @display("p=6635.35303,4801.80390;is=vs");
        }
        gNodeB20: gNodeB {
            @display("p=4809.72679,4008.68413;is=vs");
        }
        gNodeB21: gNodeB {
            @display("p=4230.82326,6288.00892;is=vs");
        }
        gNodeB22: gNodeB {
            @display("p=8039.93006,3269.83703;is=vs");
        }
        gNodeB23: gNodeB {
            @display("p=5913.59245,2653.58052;is=vs");
        }
        gNodeB24: gNodeB {
            @display("p=3769.54824,1549.67822;is=vs");
        }
        gNodeB25: gNodeB {
            @display("p=3301.14598,3678.18943;is=vs");
        }
        gNodeB26: gNodeB {
            @display("p=6129.20326,3446.27087;is=vs");
        }
        gNodeB27: gNodeB {
            @display("p=6830.18750,3278.97018;is=vs");
        }
        gNodeB28: gNodeB {
            @display("p=3746.45040,2922.69306;is=vs");
        }
        gNodeB29: gNodeB {
            @display("p=5013.30194,4775.06421;is=vs");
        }
        gNodeB30: gNodeB {
            @display("p=6338.48234,3118.36395;is=vs");
        }
        gNodeB31: gNodeB {
            @display("p=5659.60361,4938.36625;is=vs");
        }
        gNodeB32: gNodeB {
            @display("p=4987.95026,2297.87317;is=vs");
        }
        gNodeB33: gNodeB {
            @display("p=6952.30035,5264.77201;is=vs");
        }
        gNodeB34: gNodeB {
            @display("p=7082.81188,3893.52432;is=vs");
        }
        gNodeB35: gNodeB {
            @display("p=3416.98570,3222.34351;is=vs");
        }
        gNodeB36: gNodeB {
            @display("p=7080.32642,4046.08114;is=vs");
        }
        gNodeB37: gNodeB {
            @display("p=3954.97909,3383.99724;is=vs");
        }
        gNodeB38: gNodeB {
            @display("p=4588.38933,4310.19383;is=vs");
        }
        gNodeB39: gNodeB {
            @display("p=6557.19762,2969.35201;is=vs");
        }
        gNodeB40: gNodeB {
            @display("p=7092.75434,3283.29668;is=vs");
        }
        gNodeB41: gNodeB {
            @display("p=4482.80785,4155.83241;is=vs");
        }
        gNodeB42: gNodeB {
            @display("p=5352.87264,3865.10477;is=vs");
        }
        gNodeB43: gNodeB {
            @display("p=4276.76641,3541.99021;is=vs");
        }
        gNodeB44: gNodeB {
            @display("p=7200.86519,3285.05730;is=vs");
        }
        gNodeB45: gNodeB {
            @display("p=4645.94968,1857.80977;is=vs");
        }
        gNodeB46: gNodeB {
            @display("p=5357.92663,3559.99103;is=vs");
        }
        gNodeB47: gNodeB {
            @display("p=4503.19003,2935.37714;is=vs");
        }
        gNodeB48: gNodeB {
            @display("p=5131.56614,4166.63290;is=vs");
        }
        gNodeB49: gNodeB {
            @display("p=7205.83160,2979.94327;is=vs");
        }
        gNodeB50: gNodeB {
            @display("p=6348.49852,2508.13561;is=vs");
        }




    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;

        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB4.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB5.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB6.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB7.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB8.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB9.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB10.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB11.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB12.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB13.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB14.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB15.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB16.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB17.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB18.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB19.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB20.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB21.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB22.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB23.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB24.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB25.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB26.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB27.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB28.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB29.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB30.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB31.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB32.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB33.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB34.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB35.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB36.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB37.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB38.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB39.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB40.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB41.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB42.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB43.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB44.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB45.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB46.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB47.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB48.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB49.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB50.ppp;





        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

