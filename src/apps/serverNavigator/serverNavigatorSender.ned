
package simu5g.apps.serverNavigator;

import inet.applications.contract.IApp;


simple serverNavigatorSender like IApp
{
    parameters:
        int localPort = default(-1);
        int destPort = default(6000);
        string destAddress;
        
        @display("i=block/source");
    gates:
        output socketOut;
        input socketIn;
}
