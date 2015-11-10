//
//  LoginViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func verifyUserLogin(sender: AnyObject) {
        if true{
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
            self.showViewController(vc as! UIViewController, sender: vc);
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

