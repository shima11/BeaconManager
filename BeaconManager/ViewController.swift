//
//  ViewController.swift
//  BeaconManager
//
//  Created by shima jinsei on 2016/02/05.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

import PageMenu

class ViewController: UIViewController {

    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Scroll menu setup
        
        var controllerArray : [UIViewController] = []
        
        //viewcontroller1
        let controller1 : PeripheralViewController = PeripheralViewController(nibName: "PeripheralViewController", bundle: nil)
        controller1.title = "Peripheral"
        controllerArray.append(controller1)
        //viewcontroller2
        let controller2 : CentralViewController = CentralViewController(nibName: "CentralViewController", bundle: nil)
        controller2.title = "Central"
        controllerArray.append(controller2)
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.lightGrayColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .SelectedMenuItemLabelColor(UIColor.darkGrayColor()),
            .UnselectedMenuItemLabelColor(UIColor.lightGrayColor()),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 14.0)!),
            .MenuHeight(44.0),
            .MenuItemWidth(self.view.frame.width/2),
            .CenterMenuItems(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 20.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    
    }    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


