//
//  ViewController.swift
//  acr35
//
//  Created by David Wasserstrum on 11/26/14.
//  Copyright (c) 2014 FastBar Technologies, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Lets just spin up the ACR35 and make a single call
        ACRAudioJackReader().reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

