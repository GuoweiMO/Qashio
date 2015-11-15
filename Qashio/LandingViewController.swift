//
//  LandingViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var landingLoginBtn: UIButton!
    @IBOutlet weak var landingRegisterBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        landingLoginBtn.layer.cornerRadius = 5
        landingRegisterBtn.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}