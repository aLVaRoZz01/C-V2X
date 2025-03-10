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
import inet.node.ethernet.Eth400G;
import inet.node.ethernet.Eth400G;

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
        @display("bgb=3030.322,2741.856,,,0");
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
            @display("p=1887.882,499.81747;is=n;i=device/server");
        }
        router: Router {
            @display("p=1548.0061,496.96136;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=1273.8206,499.81747");
        }
        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar {

            @display("is=vs;p=2233.47,499.81747");
        }


        gNodeB1: gNodeB {
            @display("p=1669.80038,1428.99981;is=vs");
        }

        gNodeB2: gNodeB {
            @display("p=2177.06061,1618.59722;is=vs");
        }

        gNodeB3: gNodeB {
            @display("p=1364.78668,1389.63504;is=vs");
        }

        gNodeB4: gNodeB {
            @display("p=1348.08645,1271.08345;is=vs");
        }

        gNodeB5: gNodeB {
            @display("p=1694.04918,1553.86518;is=vs");
        }

        gNodeB6: gNodeB {
            @display("p=1717.89543,1926.61857;is=vs");
        }

        gNodeB7: gNodeB {
            @display("p=1554.16049,1884.88737;is=vs");
        }

        gNodeB8: gNodeB {
            @display("p=1124.34071,1725.17379;is=vs");
        }

        gNodeB9: gNodeB {
            @display("p=1224.84257,2184.63743;is=vs");
        }

        gNodeB10: gNodeB {
            @display("p=2131.86077,1988.32497;is=vs");
        }

        gNodeB11: gNodeB {
            @display("p=1707.29250,1590.97520;is=vs");
        }

        gNodeB12: gNodeB {
            @display("p=1119.65720,1483.80295;is=vs");
        }

        gNodeB13: gNodeB {
            @display("p=1561.79922,1725.02790;is=vs");
        }

        gNodeB14: gNodeB {
            @display("p=1457.50211,1695.52449;is=vs");
        }

        gNodeB15: gNodeB {
            @display("p=1343.88380,1525.29912;is=vs");
        }

        gNodeB16: gNodeB {
            @display("p=1152.65237,1649.36255;is=vs");
        }

        gNodeB17: gNodeB {
            @display("p=1241.48912,1994.19379;is=vs");
        }

        gNodeB18: gNodeB {
            @display("p=1116.74986,2182.84561;is=vs");
        }

        gNodeB19: gNodeB {
            @display("p=1033.75246,2063.42100;is=vs");
        }

        gNodeB20: gNodeB {
            @display("p=1332.93528,2186.42742;is=vs");
        }

        gNodeB21: gNodeB {
            @display("p=1089.92658,1510.64509;is=vs");
        }

        gNodeB22: gNodeB {
            @display("p=2241.21752,1743.54790;is=vs");
        }

        gNodeB23: gNodeB {
            @display("p=1170.79732,2183.70303;is=vs");
        }

        gNodeB24: gNodeB {
            @display("p=1845.23157,1279.55999;is=vs");
        }

        gNodeB25: gNodeB {
            @display("p=1549.12071,2190.00188;is=vs");
        }

        gNodeB26: gNodeB {
            @display("p=2092.09117,2046.34869;is=vs");
        }

        gNodeB27: gNodeB {
            @display("p=1292.38535,1497.55558;is=vs");
        }

        gNodeB28: gNodeB {
            @display("p=1286.29236,1518.45623;is=vs");
        }

        gNodeB29: gNodeB {
            @display("p=1480.15577,1806.24038;is=vs");
        }

        gNodeB30: gNodeB {
            @display("p=1682.84660,2027.71437;is=vs");
        }

        gNodeB31: gNodeB {
            @display("p=1686.74284,1972.88584;is=vs");
        }

        gNodeB32: gNodeB {
            @display("p=1398.61683,1742.99859;is=vs");
        }

        gNodeB33: gNodeB {
            @display("p=1471.17831,1763.53332;is=vs");
        }

        gNodeB34: gNodeB {
            @display("p=1094.26460,1367.81740;is=vs");
        }

        gNodeB35: gNodeB {
            @display("p=1092.43420,1369.00935;is=vs");
        }

        gNodeB36: gNodeB {
            @display("p=1030.14218,1914.95238;is=vs");
        }

        gNodeB37: gNodeB {
            @display("p=1164.77387,1257.19839;is=vs");
        }

        gNodeB38: gNodeB {
            @display("p=1248.32863,1890.99580;is=vs");
        }

        gNodeB39: gNodeB {
            @display("p=1351.60302,1897.91492;is=vs");
        }

        gNodeB40: gNodeB {
            @display("p=1358.65783,2011.99564;is=vs");
        }

        gNodeB41: gNodeB {
            @display("p=1448.42567,1486.60063;is=vs");
        }

        gNodeB42: gNodeB {
            @display("p=1520.60031,1267.73743;is=vs");
        }

        gNodeB43: gNodeB {
            @display("p=1564.98020,2039.04776;is=vs");
        }

        gNodeB44: gNodeB {
            @display("p=1698.81916,1303.16120;is=vs");
        }

        gNodeB45: gNodeB {
            @display("p=1722.98149,2210.13886;is=vs");
        }

        gNodeB46: gNodeB {
            @display("p=1619.42133,1809.34596;is=vs");
        }

        gNodeB47: gNodeB {
            @display("p=1778.16957,2124.31275;is=vs");
        }

        gNodeB48: gNodeB {
            @display("p=1818.04980,1425.46953;is=vs");
        }

        gNodeB49: gNodeB {
            @display("p=1827.54351,1696.53228;is=vs");
        }

        gNodeB50: gNodeB {
            @display("p=1847.32152,1859.73953;is=vs");
        }

        gNodeB51: gNodeB {
            @display("p=1873.76065,1992.04822;is=vs");
        }

        gNodeB52: gNodeB {
            @display("p=1969.37685,2218.51647;is=vs");
        }

        gNodeB53: gNodeB {
            @display("p=2012.63008,1606.78460;is=vs");
        }

        gNodeB54: gNodeB {
            @display("p=1861.66627,1377.80553;is=vs");
        }

        gNodeB55: gNodeB {
            @display("p=1915.63386,1690.21903;is=vs");
        }

        gNodeB56: gNodeB {
            @display("p=1919.52116,1299.35950;is=vs");
        }

        gNodeB57: gNodeB {
            @display("p=2029.69560,1867.30158;is=vs");
        }

        gNodeB58: gNodeB {
            @display("p=2038.83635,1468.84877;is=vs");
        }

        gNodeB59: gNodeB {
            @display("p=2055.63211,2195.46883;is=vs");
        }

        gNodeB60: gNodeB {
            @display("p=2105.59172,1347.83509;is=vs");
        }

        gNodeB61: gNodeB {
            @display("p=2200.14778,1419.24635;is=vs");
        }

        gNodeB62: gNodeB {
            @display("p=2221.78013,2171.93876;is=vs");
        }

        gNodeB63: gNodeB {
            @display("p=2188.01803,1259.47343;is=vs");
        }

        gNodeB64: gNodeB {
            @display("p=2220.97201,1891.08045;is=vs");
        }



    connections allowunconnected:
        server.pppg++ <--> Eth400G <--> router.pppg++;
        router.pppg++ <--> Eth400G <--> upf.filterGate;


        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB4.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB5.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB6.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB7.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB8.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB9.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB10.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB11.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB12.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB13.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB14.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB15.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB16.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB17.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB18.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB19.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB20.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB21.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB22.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB23.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB24.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB25.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB26.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB27.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB28.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB29.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB30.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB31.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB32.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB33.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB34.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB35.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB36.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB37.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB38.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB39.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB40.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB41.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB42.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB43.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB44.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB45.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB46.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB47.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB48.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB49.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB50.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB51.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB52.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB53.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB54.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB55.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB56.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB57.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB58.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB59.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB60.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB61.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB62.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB63.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB64.ppp;

        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

