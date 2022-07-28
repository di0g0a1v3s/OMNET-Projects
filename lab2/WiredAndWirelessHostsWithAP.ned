//
// This program is property of its copyright holder. All rights reserved.
//

package inet.examples.wireless.LabsRMSF.LAB2;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.StandardHost;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;

network WiredAndWirelessHostsWithAP
{
    @display("bgb=500,300");
    submodules:
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=50,10");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                config = xmldoc("config.xml");
                @display("p=150,10");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,10");
        }
        router1: Router {
            parameters:
                @display("p=100,100");
        }
        router2: Router {
            parameters:
                @display("p=100,200");
        }
        router3: Router {
            parameters:
                @display("p=200,200");
        }
        router4: Router {
            parameters:
                @display("p=200,100");
        }
        router5: Router {
            parameters:
                @display("p=150,150");
        }
        accessPoint1: AccessPoint {
            parameters:
                @display("p=42,108");
        }
        accessPoint2: AccessPoint {
            parameters:
                @display("p=256,63");
        }
        switch1: EtherSwitch {
            @display("p=50,235");
        }
        switch2: EtherSwitch {
            @display("p=256,178");
        }
        wiredHost1: StandardHost {
            parameters:
                @display("p=24,179");
        }
        wiredHost2: StandardHost {
            parameters:
                @display("p=281,223");
        }
        wirelessHost1: WirelessHost {
            parameters:
                @display("p=24,56");
        }
        

    connections:
        accessPoint1.ethg++ <--> Eth100M <--> router1.ethg++;
        accessPoint2.ethg++ <--> Eth100M <--> router4.ethg++;
        router5.ethg++ <--> Eth100M <--> router1.ethg++;
        router5.ethg++ <--> Eth100M <--> router2.ethg++;
        router5.ethg++ <--> Eth100M <--> router3.ethg++;
        router5.ethg++ <--> Eth100M <--> router4.ethg++;
        router1.ethg++ <--> Eth100M <--> router2.ethg++;
        router1.ethg++ <--> Eth100M <--> router4.ethg++;
        router2.ethg++ <--> Eth100M <--> router3.ethg++;
        router3.ethg++ <--> Eth100M <--> router4.ethg++;
        switch1.ethg++ <--> Eth100M <--> router2.ethg++;
        switch2.ethg++ <--> Eth100M <--> router3.ethg++;
        wiredHost1.ethg++ <--> Eth100M <--> switch1.ethg++;
        wiredHost2.ethg++ <--> Eth100M <--> switch2.ethg++;
}
