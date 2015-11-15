//
//  LoginViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.layer.cornerRadius = 5
        registerBtn.layer.cornerRadius = 5
    }
    
    @IBAction func verifyUserLogin(sender: AnyObject) {
        NSLog("userName: " + userName.text!)
        NSLog("password: " + passWord.text!)
        let localData = NSUserDefaults.standardUserDefaults()

        let storedUserName = localData.valueForKey("USER_NAME") as? String
        let storedPassword = localData.valueForKey("PASSWORD") as? String
        
        if storedUserName != nil && storedPassword != nil {
            NSLog("userName: " + storedUserName!)
            NSLog("password: " + storedPassword!)
        }
        
        if  storedUserName == userName.text &&
            storedPassword == passWord.text {
                localData.setValue(userName.text!, forKey: "USER_NAME");
                localData.setValue(passWord.text!, forKey: "PASSWORD");
                
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
                self.showViewController(vc as! UIViewController, sender: vc);
        } else{
            let alert:UIAlertController = UIAlertController.init(title: "ERROR" , message: "Your UserName or Password is not correct", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

