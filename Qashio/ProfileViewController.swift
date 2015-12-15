//
//  ProfileViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var currentUserName: UILabel!
    @IBOutlet weak var currentPassword: UILabel!
    let localData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentUserName.text = localData.valueForKey("USER_NAME") as? String
        currentPassword.text = localData.valueForKey("PASSWORD") as? String
    }
    
    @IBAction func processLogout(sender: AnyObject) {
        localData.removeObjectForKey("USER_NAME")
        localData.removeObjectForKey("PASSWORD")
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("landing")
        self.showViewController(vc as! UIViewController, sender: vc);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
