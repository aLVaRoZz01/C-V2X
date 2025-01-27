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
        @display("bgb=3000,2500,,,0");
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
            @display("p=1431.25038,1428.99981;is=vs");
        }

        gNodeB2: gNodeB {
            @display("p=818.68359,1113.62804;is=vs");
        }

        gNodeB3: gNodeB {
            @display("p=1938.51061,1618.59722;is=vs");
        }

        gNodeB4: gNodeB {
            @display("p=1126.23668,1389.63504;is=vs");
        }

        gNodeB5: gNodeB {
            @display("p=1109.53645,1271.08345;is=vs");
        }

        gNodeB6: gNodeB {
            @display("p=665.40666,1568.89459;is=vs");
        }

        gNodeB7: gNodeB {
            @display("p=1694.01062,1153.54463;is=vs");
        }

        gNodeB8: gNodeB {
            @display("p=1455.49918,1553.86518;is=vs");
        }

        gNodeB9: gNodeB {
            @display("p=1479.34543,1926.61857;is=vs");
        }

        gNodeB10: gNodeB {
            @display("p=2190.30813,1288.88236;is=vs");
        }

        gNodeB11: gNodeB {
            @display("p=2529.15039,1721.71973;is=vs");
        }

        gNodeB12: gNodeB {
            @display("p=2074.72505,1744.78287;is=vs");
        }

        gNodeB13: gNodeB {
            @display("p=2030.81898,1515.21626;is=vs");
        }

        gNodeB14: gNodeB {
            @display("p=1315.61049,1884.88737;is=vs");
        }

        gNodeB15: gNodeB {
            @display("p=885.79071,1725.17379;is=vs");
        }

        gNodeB16: gNodeB {
            @display("p=1652.43474,1127.44840;is=vs");
        }

        gNodeB17: gNodeB {
            @display("p=2140.13676,1195.20902;is=vs");
        }

        gNodeB18: gNodeB {
            @display("p=1893.31077,1988.32497;is=vs");
        }

        gNodeB19: gNodeB {
            @display("p=1468.74250,1590.97520;is=vs");
        }

        gNodeB20: gNodeB {
            @display("p=881.10720,1483.80295;is=vs");
        }

        gNodeB21: gNodeB {
            @display("p=1323.24922,1725.02790;is=vs");
        }

        gNodeB22: gNodeB {
            @display("p=1218.95211,1695.52449;is=vs");
        }

        gNodeB23: gNodeB {
            @display("p=2514.77715,1787.15605;is=vs");
        }

        gNodeB24: gNodeB {
            @display("p=2064.92322,1744.56927;is=vs");
        }

        gNodeB25: gNodeB {
            @display("p=1105.33380,1525.29912;is=vs");
        }

        gNodeB26: gNodeB {
            @display("p=914.10237,1649.36255;is=vs");
        }

        gNodeB27: gNodeB {
            @display("p=717.66476,1522.42608;is=vs");
        }

        gNodeB28: gNodeB {
            @display("p=2562.89066,2075.84940;is=vs");
        }

        gNodeB29: gNodeB {
            @display("p=710.99605,1241.51610;is=vs");
        }

        gNodeB30: gNodeB {
            @display("p=680.42267,1721.71131;is=vs");
        }

        gNodeB31: gNodeB {
            @display("p=2430.42298,2030.34978;is=vs");
        }

        gNodeB32: gNodeB {
            @display("p=707.15951,1102.88618;is=vs");
        }

        gNodeB33: gNodeB {
            @display("p=809.06713,1119.13550;is=vs");
        }

        gNodeB34: gNodeB {
            @display("p=1002.93912,1994.19379;is=vs");
        }

        gNodeB35: gNodeB {
            @display("p=2237.45539,1780.39889;is=vs");
        }

        gNodeB36: gNodeB {
            @display("p=733.22574,1282.33297;is=vs");
        }

        gNodeB37: gNodeB {
            @display("p=2351.37089,1958.60825;is=vs");
        }

        gNodeB38: gNodeB {
            @display("p=851.37658,1510.64509;is=vs");
        }

        gNodeB39: gNodeB {
            @display("p=2285.39145,2083.98174;is=vs");
        }

        gNodeB40: gNodeB {
            @display("p=2002.66752,1743.54790;is=vs");
        }

        gNodeB41: gNodeB {
            @display("p=2559.83411,1829.00551;is=vs");
        }

        gNodeB42: gNodeB {
            @display("p=1606.68157,1279.55999;is=vs");
        }

        gNodeB43: gNodeB {
            @display("p=1853.54117,2046.34869;is=vs");
        }

        gNodeB44: gNodeB {
            @display("p=709.59586,2036.55310;is=vs");
        }

        gNodeB45: gNodeB {
            @display("p=710.40454,2025.78795;is=vs");
        }

        gNodeB46: gNodeB {
            @display("p=1053.83535,1497.55558;is=vs");
        }

        gNodeB47: gNodeB {
            @display("p=1047.74236,1518.45623;is=vs");
        }

        gNodeB48: gNodeB {
            @display("p=1241.60577,1806.24038;is=vs");
        }

        gNodeB49: gNodeB {
            @display("p=1444.29660,2027.71437;is=vs");
        }

        gNodeB50: gNodeB {
            @display("p=1448.19284,1972.88584;is=vs");
        }

        gNodeB51: gNodeB {
            @display("p=1160.06683,1742.99859;is=vs");
        }

        gNodeB52: gNodeB {
            @display("p=1232.62831,1763.53332;is=vs");
        }

        gNodeB53: gNodeB {
            @display("p=735.39397,2023.86952;is=vs");
        }

        gNodeB54: gNodeB {
            @display("p=712.87655,1682.69202;is=vs");
        }

        gNodeB55: gNodeB {
            @display("p=712.44182,1756.24592;is=vs");
        }

        gNodeB56: gNodeB {
            @display("p=700.90328,1171.45414;is=vs");
        }

        gNodeB57: gNodeB {
            @display("p=1018.81168,1230.95559;is=vs");
        }

        gNodeB58: gNodeB {
            @display("p=2535.09660,2022.94782;is=vs");
        }

        gNodeB59: gNodeB {
            @display("p=750.63891,1945.00565;is=vs");
        }

        gNodeB60: gNodeB {
            @display("p=744.46235,1866.56386;is=vs");
        }

        gNodeB61: gNodeB {
            @display("p=774.70513,1135.78848;is=vs");
        }

        gNodeB62: gNodeB {
            @display("p=855.71460,1367.81740;is=vs");
        }

        gNodeB63: gNodeB {
            @display("p=853.88420,1369.00935;is=vs");
        }

        gNodeB64: gNodeB {
            @display("p=668.78829,1398.60448;is=vs");
        }

        gNodeB65: gNodeB {
            @display("p=592.23482,2010.76428;is=vs");
        }

        gNodeB66: gNodeB {
            @display("p=581.24536,1947.95710;is=vs");
        }

        gNodeB67: gNodeB {
            @display("p=927.06363,1956.17888;is=vs");
        }

        gNodeB68: gNodeB {
            @display("p=1042.83065,1102.75088;is=vs");
        }

        gNodeB69: gNodeB {
            @display("p=986.98484,1858.36451;is=vs");
        }

        gNodeB70: gNodeB {
            @display("p=1196.26444,1107.04920;is=vs");
        }

        gNodeB71: gNodeB {
            @display("p=1151.54483,1899.63284;is=vs");
        }

        gNodeB72: gNodeB {
            @display("p=1178.21606,2065.49904;is=vs");
        }

        gNodeB73: gNodeB {
            @display("p=1257.50121,1195.09594;is=vs");
        }

        gNodeB74: gNodeB {
            @display("p=1279.10270,1489.82829;is=vs");
        }

        gNodeB75: gNodeB {
            @display("p=1327.32771,1348.21981;is=vs");
        }

        gNodeB76: gNodeB {
            @display("p=1274.03036,1980.59118;is=vs");
        }

        gNodeB77: gNodeB {
            @display("p=1349.55292,1083.99544;is=vs");
        }

        gNodeB78: gNodeB {
            @display("p=1309.27013,1177.67126;is=vs");
        }

        gNodeB79: gNodeB {
            @display("p=1472.77846,1828.70308;is=vs");
        }

        gNodeB80: gNodeB {
            @display("p=1448.45155,1091.88149;is=vs");
        }

        gNodeB81: gNodeB {
            @display("p=1588.21078,1459.95259;is=vs");
        }

        gNodeB82: gNodeB {
            @display("p=1541.70242,1670.42085;is=vs");
        }

        gNodeB83: gNodeB {
            @display("p=1590.73441,2062.51499;is=vs");
        }

        gNodeB84: gNodeB {
            @display("p=1564.40917,1889.34748;is=vs");
        }

        gNodeB85: gNodeB {
            @display("p=1686.26326,1586.12368;is=vs");
        }

        gNodeB86: gNodeB {
            @display("p=1672.53571,1954.36982;is=vs");
        }

        gNodeB87: gNodeB {
            @display("p=1773.59190,1337.54954;is=vs");
        }

        gNodeB88: gNodeB {
            @display("p=1723.28611,1736.97120;is=vs");
        }

        gNodeB89: gNodeB {
            @display("p=1782.35531,1300.87718;is=vs");
        }

        gNodeB90: gNodeB {
            @display("p=1873.16252,1515.35769;is=vs");
        }

        gNodeB91: gNodeB {
            @display("p=1831.59346,1079.75766;is=vs");
        }

        gNodeB92: gNodeB {
            @display("p=1889.16053,1905.20549;is=vs");
        }

        gNodeB93: gNodeB {
            @display("p=1874.19712,1293.50737;is=vs");
        }

        gNodeB94: gNodeB {
            @display("p=1897.58365,1186.53636;is=vs");
        }

        gNodeB95: gNodeB {
            @display("p=2005.70222,1917.44980;is=vs");
        }

        gNodeB96: gNodeB {
            @display("p=2040.66755,2024.23506;is=vs");
        }

        gNodeB97: gNodeB {
            @display("p=1958.26260,1089.73127;is=vs");
        }

        gNodeB98: gNodeB {
            @display("p=2007.96284,1219.60958;is=vs");
        }

        gNodeB99: gNodeB {
            @display("p=2125.96747,1962.33284;is=vs");
        }

        gNodeB100: gNodeB {
            @display("p=2182.89456,1574.16514;is=vs");
        }

        gNodeB101: gNodeB {
            @display("p=2088.10943,1453.75329;is=vs");
        }

        gNodeB102: gNodeB {
            @display("p=2279.07798,1121.24386;is=vs");
        }

        gNodeB103: gNodeB {
            @display("p=2295.40466,1523.65827;is=vs");
        }

        gNodeB104: gNodeB {
            @display("p=2371.76399,1340.26893;is=vs");
        }

        gNodeB105: gNodeB {
            @display("p=2338.59341,1216.95179;is=vs");
        }

        gNodeB106: gNodeB {
            @display("p=2407.34226,1651.06523;is=vs");
        }

        gNodeB107: gNodeB {
            @display("p=2311.77765,1086.80206;is=vs");
        }

        gNodeB108: gNodeB {
            @display("p=2451.32384,1472.53158;is=vs");
        }

        gNodeB109: gNodeB {
            @display("p=2495.06392,1305.92753;is=vs");
        }

        gNodeB110: gNodeB {
            @display("p=2521.12468,1168.34873;is=vs");
        }

        gNodeB111: gNodeB {
            @display("p=2513.53305,1580.92407;is=vs");
        }

        gNodeB112: gNodeB {
            @display("p=2481.71064,1420.20277;is=vs");
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
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB65.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB66.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB67.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB68.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB69.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB70.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB71.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB72.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB73.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB74.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB75.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB76.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB77.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB78.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB79.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB80.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB81.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB82.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB83.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB84.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB85.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB86.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB87.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB88.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB89.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB90.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB91.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB92.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB93.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB94.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB95.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB96.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB97.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB98.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB99.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB100.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB101.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB102.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB103.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB104.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB105.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB106.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB107.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB108.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB109.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB110.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB111.ppp;
        upf.pppg++ <--> Eth400G { @display("ls=,0,da"); } <--> gNodeB112.ppp;

        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

