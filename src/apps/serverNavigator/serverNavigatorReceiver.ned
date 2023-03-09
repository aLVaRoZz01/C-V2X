

package simu5g.apps.serverNavigator;

import inet.applications.contract.IApp;


simple serverNavigatorReceiver like IApp
{
    parameters:
        int localPort = default(6000);

        @display("i=block/source");
    gates:
        output socketOut;
        input socketIn;
}

