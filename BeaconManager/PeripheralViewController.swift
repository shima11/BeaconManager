//
//  PeripheralViewController.swift
//  BeaconManager
//
//  Created by shima jinsei on 2016/02/14.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit
import CoreLocation

class PeripheralViewController: UIViewController, BeaconMonitorDelegate {

    var beaconMonitor: BeaconMonitor?

    @IBOutlet weak var tableView: UITableView!
    
    let uuid = "5E818A3A-C6A5-49CD-B252-82E3E624F76B"
    //let identifier = "kIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //複数のUUIDのBeaconの受信
        //        let beacon1 = Beacon(uuid: NSUUID(UUIDString: uuid)!, minor: 121, major: 3)
        //        let beacon2 = Beacon(uuid: NSUUID(UUIDString: uuid)!, minor: 121, major: 3)
        //        let beacon3 = Beacon(uuid: NSUUID(UUIDString: uuid)!, minor: 121, major: 3)
        //        monitor = BeaconMonitor(beacons: [beacon1,beacon2,beacon3])
        
        //単一Beaconの受信
        beaconMonitor = BeaconMonitor(uuid: NSUUID(UUIDString:uuid)!)
        beaconMonitor!.delegate = self
        //beaconMonitor!.startListening()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        beaconMonitor!.startListening()
    }
    
    override func viewWillDisappear(animated: Bool) {
        beaconMonitor!.stopListening()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//Beacon受信時
extension ViewController: BeaconMonitorDelegate {
    
    @objc func receivedAllBeacons(monitor: BeaconMonitor, beacons: [CLBeacon]) {
        
        print("All Beacons: \(beacons)")
    }
    
    @objc func receivedMatchingBeacons(monitor: BeaconMonitor, beacons: [CLBeacon]) {
        
        print("Matching Beacons: \(beacons)")
        
    }
}
