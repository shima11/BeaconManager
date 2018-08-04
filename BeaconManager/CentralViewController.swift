//
//  CentralViewController.swift
//  BeaconManager
//
//  Created by shima jinsei on 2016/02/15.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth
import LTMorphingLabel

class CentralViewController: UIViewController, LTMorphingLabelDelegate {

    var morphingLabel: LTMorphingLabel!

    let uuid = "5E818A3A-C6A5-49CD-B252-82E3E624F76B"
    let identifier = "kIdentifier"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //beaconの発信
        //BeaconSender.sharedInstance.startSending(UUID: uuid, majorID: 2, minorID: 3, identifier: identifier)

        // morphing label
        let labelRect = CGRectMake(10, 80, 100, 100)
        morphingLabel = LTMorphingLabel.init(frame: labelRect)
        morphingLabel.morphingEffect = .Evaporate
        morphingLabel.text = "state"
        morphingLabel.textColor = UIColor.darkTextColor()
        morphingLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(morphingLabel)

        morphingLabel.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit {
        morphingLabel.delegate = nil
    }
    
    @IBAction func countt(sender: AnyObject) {
        morphingLabel.text = "Sending・・・"
    }
    
    override func viewWillAppear(animated: Bool) {
        //beaconの発信
        BeaconSender.sharedInstance.startSending(UUID: uuid, majorID: 2, minorID: 3, identifier: identifier)
    }
    
    override func viewWillDisappear(animated: Bool) {
        //beacon　停止
        BeaconSender.sharedInstance.stopSending()
    }

    
    
}


// LTMorphingLabel Method
extension ViewController {
    
    func morphingDidStart(label: LTMorphingLabel) {
        
    }
    
    func morphingDidComplete(label: LTMorphingLabel) {
        
    }
    
    func morphingOnProgress(label: LTMorphingLabel, _ progress: Float) {
        
    }
    
}
