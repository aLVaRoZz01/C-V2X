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
        
        gNodeB2: gNodeB {
            @display("p=651.96793,998.58380;is=vs");
        }
        
        gNodeB3: gNodeB {
            @display("p=1431.25038,2147.78981;is=vs");
        }
        
        gNodeB4: gNodeB {
            @display("p=818.68359,1832.41804;is=vs");
        }
        
        gNodeB5: gNodeB {
            @display("p=1938.51061,2337.38722;is=vs");
        }
        
        gNodeB6: gNodeB {
            @display("p=1126.23668,2108.42504;is=vs");
        }
        
        gNodeB7: gNodeB {
            @display("p=1763.01924,1695.45989;is=vs");
        }
        
        gNodeB8: gNodeB {
            @display("p=1109.53645,1989.87345;is=vs");
        }
        
        gNodeB9: gNodeB {
            @display("p=665.40666,2287.68459;is=vs");
        }
        
        gNodeB10: gNodeB {
            @display("p=1694.01062,1872.33463;is=vs");
        }
        
        gNodeB11: gNodeB {
            @display("p=1455.49918,2272.65518;is=vs");
        }
        
        gNodeB12: gNodeB {
            @display("p=1479.34543,2645.40857;is=vs");
        }
        
        gNodeB13: gNodeB {
            @display("p=1876.10607,1392.12195;is=vs");
        }
        
        gNodeB14: gNodeB {
            @display("p=2190.30813,2007.67236;is=vs");
        }
        
        gNodeB15: gNodeB {
            @display("p=2529.15039,2440.50973;is=vs");
        }
        
        gNodeB16: gNodeB {
            @display("p=2074.72505,2463.57287;is=vs");
        }
        
        gNodeB17: gNodeB {
            @display("p=2030.81898,2234.00626;is=vs");
        }
        
        gNodeB18: gNodeB {
            @display("p=1315.61049,2603.67737;is=vs");
        }
        
        gNodeB19: gNodeB {
            @display("p=885.79071,2443.96379;is=vs");
        }
        
        gNodeB20: gNodeB {
            @display("p=1654.94725,1693.68091;is=vs");
        }
        
        gNodeB21: gNodeB {
            @display("p=1443.66185,1606.52257;is=vs");
        }
        
        gNodeB22: gNodeB {
            @display("p=1652.43474,1846.23840;is=vs");
        }
        
        gNodeB23: gNodeB {
            @display("p=2305.86533,1551.79958;is=vs");
        }
        
        gNodeB24: gNodeB {
            @display("p=1878.61358,1239.56436;is=vs");
        }
        
        gNodeB25: gNodeB {
            @display("p=1060.70451,1378.61879;is=vs");
        }
        
        gNodeB26: gNodeB {
            @display("p=2140.13676,1913.99902;is=vs");
        }
        
        gNodeB27: gNodeB {
            @display("p=1565.26951,1081.82316;is=vs");
        }
        
        gNodeB28: gNodeB {
            @display("p=652.47524,972.81244;is=vs");
        }
        
        gNodeB29: gNodeB {
            @display("p=1122.16409,1227.08586;is=vs");
        }
        
        gNodeB30: gNodeB {
            @display("p=1979.16321,1699.01233;is=vs");
        }
        
        gNodeB31: gNodeB {
            @display("p=1550.96002,1691.96517;is=vs");
        }
        
        gNodeB32: gNodeB {
            @display("p=1535.29547,1725.37602;is=vs");
        }
        
        gNodeB33: gNodeB {
            @display("p=694.97946,914.79963;is=vs");
        }
        
        gNodeB34: gNodeB {
            @display("p=1893.31077,2707.11497;is=vs");
        }
        
        gNodeB35: gNodeB {
            @display("p=1468.74250,2309.76520;is=vs");
        }
        
        gNodeB36: gNodeB {
            @display("p=881.10720,2202.59295;is=vs");
        }
        
        gNodeB37: gNodeB {
            @display("p=1323.24922,2443.81790;is=vs");
        }
        
        gNodeB38: gNodeB {
            @display("p=1902.48585,883.91474;is=vs");
        }
        
        gNodeB39: gNodeB {
            @display("p=2479.19465,867.92048;is=vs");
        }
        
        gNodeB40: gNodeB {
            @display("p=1839.65027,1416.92019;is=vs");
        }
        
        gNodeB41: gNodeB {
            @display("p=1713.06088,1743.19451;is=vs");
        }
        
        gNodeB42: gNodeB {
            @display("p=1218.95211,2414.31449;is=vs");
        }
        
        gNodeB43: gNodeB {
            @display("p=803.89330,1737.05414;is=vs");
        }
        
        gNodeB44: gNodeB {
            @display("p=1104.50046,1343.45250;is=vs");
        }
        
        gNodeB45: gNodeB {
            @display("p=2514.77715,2505.94605;is=vs");
        }
        
        gNodeB46: gNodeB {
            @display("p=1642.80456,1210.44362;is=vs");
        }
        
        gNodeB47: gNodeB {
            @display("p=1889.37684,1288.83950;is=vs");
        }
        
        gNodeB48: gNodeB {
            @display("p=2064.92322,2463.35927;is=vs");
        }
        
        gNodeB49: gNodeB {
            @display("p=2458.01923,1388.16576;is=vs");
        }
        
        gNodeB50: gNodeB {
            @display("p=2340.44225,1545.69831;is=vs");
        }
        
        gNodeB51: gNodeB {
            @display("p=1546.70485,1701.78462;is=vs");
        }
        
        gNodeB52: gNodeB {
            @display("p=1105.33380,2244.08912;is=vs");
        }
        
        gNodeB53: gNodeB {
            @display("p=914.10237,2368.15255;is=vs");
        }
        
        gNodeB54: gNodeB {
            @display("p=717.66476,2241.21608;is=vs");
        }
        
        gNodeB55: gNodeB {
            @display("p=2562.89066,2794.63940;is=vs");
        }
        
        gNodeB56: gNodeB {
            @display("p=710.99605,1960.30610;is=vs");
        }
        
        gNodeB57: gNodeB {
            @display("p=680.42267,2440.50131;is=vs");
        }
        
        gNodeB58: gNodeB {
            @display("p=2302.54576,1518.96521;is=vs");
        }
        
        gNodeB59: gNodeB {
            @display("p=2297.14178,1695.22223;is=vs");
        }
        
        gNodeB60: gNodeB {
            @display("p=896.72084,1242.44571;is=vs");
        }
        
        gNodeB61: gNodeB {
            @display("p=1792.13612,1238.12598;is=vs");
        }
        
        gNodeB62: gNodeB {
            @display("p=1435.34071,1247.46994;is=vs");
        }
        
        gNodeB63: gNodeB {
            @display("p=1993.75533,809.07528;is=vs");
        }
        
        gNodeB64: gNodeB {
            @display("p=2430.42298,2749.13978;is=vs");
        }
        
        gNodeB65: gNodeB {
            @display("p=803.03849,916.59512;is=vs");
        }
        
        gNodeB66: gNodeB {
            @display("p=2307.53091,1450.04204;is=vs");
        }
        
        gNodeB67: gNodeB {
            @display("p=1763.01924,1695.45989;is=vs");
        }
        
        gNodeB68: gNodeB {
            @display("p=707.15951,1821.67618;is=vs");
        }
        
        gNodeB69: gNodeB {
            @display("p=840.87167,1572.21091;is=vs");
        }
        
        gNodeB70: gNodeB {
            @display("p=809.06713,1837.92550;is=vs");
        }
        
        gNodeB71: gNodeB {
            @display("p=893.05015,918.13762;is=vs");
        }
        
        gNodeB72: gNodeB {
            @display("p=692.01427,1525.17944;is=vs");
        }
        
        gNodeB73: gNodeB {
            @display("p=1002.93912,2712.98379;is=vs");
        }
        
        gNodeB74: gNodeB {
            @display("p=2237.45539,2499.18889;is=vs");
        }
        
        gNodeB75: gNodeB {
            @display("p=733.22574,2001.12297;is=vs");
        }
        
        gNodeB76: gNodeB {
            @display("p=2351.37089,2677.39825;is=vs");
        }
        
        gNodeB77: gNodeB {
            @display("p=851.37658,2229.43509;is=vs");
        }
        
        gNodeB78: gNodeB {
            @display("p=2285.39145,2802.77174;is=vs");
        }
        
        gNodeB79: gNodeB {
            @display("p=2002.66752,2462.33790;is=vs");
        }
        
        gNodeB80: gNodeB {
            @display("p=2559.83411,2547.79551;is=vs");
        }
        
        gNodeB81: gNodeB {
            @display("p=2518.29916,1784.17752;is=vs");
        }
        
        gNodeB82: gNodeB {
            @display("p=1606.68157,1998.34999;is=vs");
        }
        
        gNodeB83: gNodeB {
            @display("p=2556.87176,1774.47340;is=vs");
        }
        
        gNodeB84: gNodeB {
            @display("p=1853.54117,2765.13869;is=vs");
        }
        
        gNodeB85: gNodeB {
            @display("p=1738.94359,1361.48193;is=vs");
        }
        
        gNodeB86: gNodeB {
            @display("p=709.59586,2755.34310;is=vs");
        }
        
        gNodeB87: gNodeB {
            @display("p=710.40454,2744.57795;is=vs");
        }
        
        gNodeB88: gNodeB {
            @display("p=1053.83535,2216.34558;is=vs");
        }
        
        gNodeB89: gNodeB {
            @display("p=1128.98769,1533.20547;is=vs");
        }
        
        gNodeB90: gNodeB {
            @display("p=1144.73561,1461.57185;is=vs");
        }
        
        gNodeB91: gNodeB {
            @display("p=1047.74236,2237.24623;is=vs");
        }
        
        gNodeB92: gNodeB {
            @display("p=1241.60577,2525.03038;is=vs");
        }
        
        gNodeB93: gNodeB {
            @display("p=1444.29660,2746.50437;is=vs");
        }
        
        gNodeB94: gNodeB {
            @display("p=1448.19284,2691.67584;is=vs");
        }
        
        gNodeB95: gNodeB {
            @display("p=1160.06683,2461.78859;is=vs");
        }
        
        gNodeB96: gNodeB {
            @display("p=1232.62831,2482.32332;is=vs");
        }
        
        gNodeB97: gNodeB {
            @display("p=735.39397,2742.65952;is=vs");
        }
        
        gNodeB98: gNodeB {
            @display("p=712.87655,2401.48202;is=vs");
        }
        
        gNodeB99: gNodeB {
            @display("p=712.44182,2475.03592;is=vs");
        }
        
        gNodeB100: gNodeB {
            @display("p=700.90328,1890.24414;is=vs");
        }
        
        gNodeB101: gNodeB {
            @display("p=1018.81168,1949.74559;is=vs");
        }
        
        gNodeB102: gNodeB {
            @display("p=2535.09660,2741.73782;is=vs");
        }
        
        gNodeB103: gNodeB {
            @display("p=750.63891,2663.79565;is=vs");
        }
        
        gNodeB104: gNodeB {
            @display("p=744.46235,2585.35386;is=vs");
        }
        
        gNodeB105: gNodeB {
            @display("p=774.70513,1854.57848;is=vs");
        }
        
        gNodeB106: gNodeB {
            @display("p=855.71460,2086.60740;is=vs");
        }
        
        gNodeB107: gNodeB {
            @display("p=853.88420,2087.79935;is=vs");
        }
        
        gNodeB108: gNodeB {
            @display("p=668.78829,2117.39448;is=vs");
        }
        
        gNodeB109: gNodeB {
            @display("p=2565.12286,1606.59679;is=vs");
        }
        
        gNodeB110: gNodeB {
            @display("p=559.00000,2774.66000;is=vs");
        }
        
        gNodeB111: gNodeB {
            @display("p=561.00000,2624.66000;is=vs");
        }
        
        gNodeB112: gNodeB {
            @display("p=576.00000,1748.66000;is=vs");
        }
        
        gNodeB113: gNodeB {
            @display("p=581.00000,1423.66000;is=vs");
        }
        
        gNodeB114: gNodeB {
            @display("p=584.00000,1273.66000;is=vs");
        }
        
        gNodeB115: gNodeB {
            @display("p=591.00000,806.66000;is=vs");
        }
        
        gNodeB116: gNodeB {
            @display("p=667.00000,1148.66000;is=vs");
        }
        
        gNodeB117: gNodeB {
            @display("p=713.00000,1351.66000;is=vs");
        }
        
        gNodeB118: gNodeB {
            @display("p=793.00000,1066.66000;is=vs");
        }
        
        gNodeB119: gNodeB {
            @display("p=846.00000,1421.66000;is=vs");
        }
        
        gNodeB120: gNodeB {
            @display("p=893.00000,2610.66000;is=vs");
        }
        
        gNodeB121: gNodeB {
            @display("p=940.00000,1098.66000;is=vs");
        }
        
        gNodeB122: gNodeB {
            @display("p=944.00000,1682.66000;is=vs");
        }
        
        gNodeB123: gNodeB {
            @display("p=951.00000,779.66000;is=vs");
        }
        
        gNodeB124: gNodeB {
            @display("p=974.00000,1502.66000;is=vs");
        }
        
        gNodeB125: gNodeB {
            @display("p=1015.00000,2522.66000;is=vs");
        }
        
        gNodeB126: gNodeB {
            @display("p=1031.00000,978.66000;is=vs");
        }
        
        gNodeB127: gNodeB {
            @display("p=1037.00000,1800.66000;is=vs");
        }
        
        gNodeB128: gNodeB {
            @display("p=1125.00000,2625.66000;is=vs");
        }
        
        gNodeB129: gNodeB {
            @display("p=1131.00000,1683.66000;is=vs");
        }
        
        gNodeB130: gNodeB {
            @display("p=1136.00000,2783.66000;is=vs");
        }
        
        gNodeB131: gNodeB {
            @display("p=1144.00000,1078.66000;is=vs");
        }
        
        gNodeB132: gNodeB {
            @display("p=1177.00000,1855.66000;is=vs");
        }
        
        gNodeB133: gNodeB {
            @display("p=1248.00000,2197.66000;is=vs");
        }
        
        gNodeB134: gNodeB {
            @display("p=1250.00000,1306.66000;is=vs");
        }
        
        gNodeB135: gNodeB {
            @display("p=1255.00000,2030.66000;is=vs");
        }
        
        gNodeB136: gNodeB {
            @display("p=1260.00000,1606.66000;is=vs");
        }
        
        gNodeB137: gNodeB {
            @display("p=1264.00000,988.66000;is=vs");
        }
        
        gNodeB138: gNodeB {
            @display("p=1272.00000,1157.66000;is=vs");
        }
        
        gNodeB139: gNodeB {
            @display("p=1283.00000,2753.66000;is=vs");
        }
        
        gNodeB140: gNodeB {
            @display("p=1288.00000,1754.66000;is=vs");
        }
        
        gNodeB141: gNodeB {
            @display("p=1295.00000,1460.66000;is=vs");
        }
        
        gNodeB142: gNodeB {
            @display("p=1329.00000,1899.66000;is=vs");
        }
        
        gNodeB143: gNodeB {
            @display("p=1340.00000,785.66000;is=vs");
        }
        
        gNodeB144: gNodeB {
            @display("p=1392.00000,1067.66000;is=vs");
        }
        
        gNodeB145: gNodeB {
            @display("p=1410.00000,918.66000;is=vs");
        }
        
        gNodeB146: gNodeB {
            @display("p=1432.00000,1398.66000;is=vs");
        }
        
        gNodeB147: gNodeB {
            @display("p=1443.00000,1997.66000;is=vs");
        }
        
        gNodeB148: gNodeB {
            @display("p=1465.00000,2495.66000;is=vs");
        }
        
        gNodeB149: gNodeB {
            @display("p=1490.00000,791.66000;is=vs");
        }
        
        gNodeB150: gNodeB {
            @display("p=1546.00000,1496.66000;is=vs");
        }
        
        gNodeB151: gNodeB {
            @display("p=1560.00000,931.66000;is=vs");
        }
        
        gNodeB152: gNodeB {
            @display("p=1572.00000,1344.66000;is=vs");
        }
        
        gNodeB153: gNodeB {
            @display("p=1577.00000,2184.66000;is=vs");
        }
        
        gNodeB154: gNodeB {
            @display("p=1585.00000,2405.66000;is=vs");
        }
        
        gNodeB155: gNodeB {
            @display("p=1588.00000,2791.66000;is=vs");
        }
        
        gNodeB156: gNodeB {
            @display("p=1602.00000,2558.66000;is=vs");
        }
        
        gNodeB157: gNodeB {
            @display("p=1640.00000,804.66000;is=vs");
        }
        
        gNodeB158: gNodeB {
            @display("p=1683.00000,2291.66000;is=vs");
        }
        
        gNodeB159: gNodeB {
            @display("p=1688.00000,1546.66000;is=vs");
        }
        
        gNodeB160: gNodeB {
            @display("p=1690.00000,2681.66000;is=vs");
        }
        
        gNodeB161: gNodeB {
            @display("p=1693.00000,1002.66000;is=vs");
        }
        
        gNodeB162: gNodeB {
            @display("p=1708.00000,2110.66000;is=vs");
        }
        
        gNodeB163: gNodeB {
            @display("p=1722.00000,2468.66000;is=vs");
        }
        
        gNodeB164: gNodeB {
            @display("p=1793.00000,1986.66000;is=vs");
        }
        
        gNodeB165: gNodeB {
            @display("p=1814.00000,2217.66000;is=vs");
        }
        
        gNodeB166: gNodeB {
            @display("p=1816.00000,1089.66000;is=vs");
        }
        
        gNodeB167: gNodeB {
            @display("p=1833.00000,2569.66000;is=vs");
        }
        
        gNodeB168: gNodeB {
            @display("p=1838.00000,1829.66000;is=vs");
        }
        
        gNodeB169: gNodeB {
            @display("p=1842.00000,1567.66000;is=vs");
        }
        
        gNodeB170: gNodeB {
            @display("p=1899.00000,2093.66000;is=vs");
        }
        
        gNodeB171: gNodeB {
            @display("p=1937.00000,1944.66000;is=vs");
        }
        
        gNodeB172: gNodeB {
            @display("p=1952.00000,1025.66000;is=vs");
        }
        
        gNodeB173: gNodeB {
            @display("p=1978.00000,1503.66000;is=vs");
        }
        
        gNodeB174: gNodeB {
            @display("p=2009.00000,1164.66000;is=vs");
        }
        
        gNodeB175: gNodeB {
            @display("p=2010.00000,2612.66000;is=vs");
        }
        
        gNodeB176: gNodeB {
            @display("p=2013.00000,2798.66000;is=vs");
        }
        
        gNodeB177: gNodeB {
            @display("p=2023.00000,1359.66000;is=vs");
        }
        
        gNodeB178: gNodeB {
            @display("p=2043.00000,2051.66000;is=vs");
        }
        
        gNodeB179: gNodeB {
            @display("p=2073.00000,936.66000;is=vs");
        }
        
        gNodeB180: gNodeB {
            @display("p=2093.00000,1600.66000;is=vs");
        }
        
        gNodeB181: gNodeB {
            @display("p=2114.00000,1765.66000;is=vs");
        }
        
        gNodeB182: gNodeB {
            @display("p=2130.00000,2704.66000;is=vs");
        }
        
        gNodeB183: gNodeB {
            @display("p=2130.00000,1253.66000;is=vs");
        }
        
        gNodeB184: gNodeB {
            @display("p=2130.00000,1075.66000;is=vs");
        }
        
        gNodeB185: gNodeB {
            @display("p=2138.00000,1456.66000;is=vs");
        }
        
        gNodeB186: gNodeB {
            @display("p=2144.00000,803.66000;is=vs");
        }
        
        gNodeB187: gNodeB {
            @display("p=2146.00000,2330.66000;is=vs");
        }
        
        gNodeB188: gNodeB {
            @display("p=2159.00000,2155.66000;is=vs");
        }
        
        gNodeB189: gNodeB {
            @display("p=2222.00000,956.66000;is=vs");
        }
        
        gNodeB190: gNodeB {
            @display("p=2251.00000,1164.66000;is=vs");
        }
        
        gNodeB191: gNodeB {
            @display("p=2273.00000,1843.66000;is=vs");
        }
        
        gNodeB192: gNodeB {
            @display("p=2275.00000,2253.66000;is=vs");
        }
        
        gNodeB193: gNodeB {
            @display("p=2293.00000,823.66000;is=vs");
        }
        
        gNodeB194: gNodeB {
            @display("p=2304.00000,2105.66000;is=vs");
        }
        
        gNodeB195: gNodeB {
            @display("p=2317.00000,1299.66000;is=vs");
        }
        
        gNodeB196: gNodeB {
            @display("p=2340.00000,2389.66000;is=vs");
        }
        
        gNodeB197: gNodeB {
            @display("p=2343.00000,1045.66000;is=vs");
        }
        
        gNodeB198: gNodeB {
            @display("p=2361.00000,1966.66000;is=vs");
        }
        
        gNodeB199: gNodeB {
            @display("p=2409.00000,1180.66000;is=vs");
        }
        
        gNodeB200: gNodeB {
            @display("p=2417.00000,2204.66000;is=vs");
        }
        
        gNodeB201: gNodeB {
            @display("p=2474.00000,2065.66000;is=vs");
        }
        
        gNodeB202: gNodeB {
            @display("p=2491.00000,1020.66000;is=vs");
        }
        
        gNodeB203: gNodeB {
            @display("p=2537.00000,1259.66000;is=vs");
        }
        
        gNodeB204: gNodeB {
            @display("p=2540.00000,2290.66000;is=vs");
        }
        
        gNodeB205: gNodeB {
            @display("p=2544.00000,1932.66000;is=vs");
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
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB51.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB52.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB53.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB54.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB55.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB56.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB57.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB58.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB59.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB60.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB61.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB62.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB63.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB64.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB65.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB66.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB67.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB68.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB69.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB70.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB71.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB72.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB73.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB74.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB75.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB76.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB77.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB78.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB79.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB80.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB81.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB82.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB83.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB84.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB85.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB86.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB87.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB88.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB89.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB90.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB91.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB92.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB93.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB94.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB95.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB96.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB97.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB98.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB99.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB100.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB101.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB102.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB103.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB104.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB105.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB106.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB107.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB108.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB109.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB110.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB111.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB112.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB113.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB114.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB115.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB116.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB117.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB118.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB119.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB120.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB121.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB122.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB123.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB124.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB125.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB126.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB127.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB128.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB129.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB130.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB131.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB132.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB133.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB134.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB135.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB136.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB137.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB138.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB139.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB140.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB141.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB142.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB143.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB144.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB145.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB146.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB147.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB148.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB149.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB150.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB151.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB152.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB153.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB154.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB155.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB156.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB157.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB158.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB159.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB160.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB161.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB162.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB163.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB164.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB165.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB166.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB167.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB168.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB169.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB170.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB171.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB172.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB173.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB174.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB175.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB176.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB177.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB178.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB179.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB180.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB181.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB182.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB183.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB184.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB185.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB186.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB187.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB188.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB189.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB190.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB191.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB192.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB193.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB194.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB195.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB196.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB197.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB198.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB199.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB200.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB201.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB202.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB203.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB204.ppp;
        upf.pppg++ <--> Eth10G { @display("ls=,0,da"); } <--> gNodeB205.ppp;

        



        //# X2 connections
        //# gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
}

