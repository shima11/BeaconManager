//
//  BeaconManager.swift
//  BeaconManager
//
//  Created by shima jinsei on 2016/02/05.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

public class BeaconSender: NSObject,CBPeripheralManagerDelegate {

    /*
        method1
        プライベートイニシャライザを用いた方法
    */
//    static let sharedInstance: BeaconSender = BeaconSender()
//    private override init() {}
    
    /*
        method2
        クロージャを用いた方法
    */
    static let sharedInstance: BeaconSender = {
        let instance = BeaconSender()
        // ここで初期値セットアップのコードを書きます。
        
        return instance
    }()
    
    
    
    private var _region: CLBeaconRegion?
    private var _peripheralManager: CBPeripheralManager?
    //private var _locationManager: CLLocationManager?
    
    private var _uuid = ""
    private var _identifier = ""
    private var _major: CLBeaconMajorValue = 0
    private var _minor: CLBeaconMinorValue = 0
    
    internal func startSending(UUID uuid: String, majorID: CLBeaconMajorValue, minorID: CLBeaconMinorValue, identifier: String) {
        
        _uuid = uuid
        _identifier = identifier
        _major = majorID
        _minor = minorID
        
        stopSending() //stop sending when it's active
        

        _peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        //_locationManager?.requestAlwaysAuthorization()

    }
    
    public func stopSending() {
        print("Stop advertising")
        _peripheralManager?.stopAdvertising()
    }
    
    
    // MARK: CBPeripheralManagerDelegate
    
    public func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
        if (error != nil) {
            print("error:\(error)")
        } else {
            print("start advertising")
            // Show beacon's pulse
        }
    }
    
    public func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
        
        if peripheral.state == CBPeripheralManagerState.PoweredOn {
    
            // iBeaconのUUID.
            let myUUID = NSUUID(UUIDString: _uuid)
            
            // BeaconRegionを定義.
            let myBeaconRegion = CLBeaconRegion(proximityUUID: myUUID!, major: _major, minor: _minor, identifier: _identifier)
            
            // Advertisingのフォーマットを作成.
            let myBeaconPeripheralData = NSDictionary(dictionary: myBeaconRegion.peripheralDataWithMeasuredPower(nil))
            
            // Advertisingを発信.
            _peripheralManager!.startAdvertising(myBeaconPeripheralData as? [String : AnyObject] as [String : AnyObject]?)
            
            print("DidUpdateState")
        }
        else if peripheral.state == CBPeripheralManagerState.PoweredOff {
            
            peripheral.stopAdvertising()
            
        }
        
    }

    
}
