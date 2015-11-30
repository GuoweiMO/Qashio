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
        print("userName: " + userName.text!)
        print("password: " + passWord.text!)
        let localData = NSUserDefaults.standardUserDefaults()

        let storedUserName = localData.valueForKey("USER_NAME") as? String //as? return nil or String
        let storedPassword = localData.valueForKey("PASSWORD") as? String
        
        if storedUserName != nil && !storedPassword!.isEmpty && storedPassword != nil && !storedPassword!.isEmpty {
            print("saved userName: " + storedUserName!)
            print("saved password: " + storedPassword!)
        }
        
        
        if  storedUserName == userName.text && storedPassword == passWord.text {
            //check against the data in db
                localData.setValue(userName.text!, forKey: "USER_NAME");
                localData.setValue(passWord.text!, forKey: "PASSWORD");
                
                let vc:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
                self.showViewController(vc, sender: vc);
        } else{
            let alert:UIAlertController = UIAlertController(title: "ERROR" , message: "Your UserName or Password is not correct", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
//            let alertController = UIAlertController(title: "Email?", message: "Please input your email:", preferredStyle: .Alert)
//            
//            let confirmAction = UIAlertAction(title: "Confirm", style: .Default) { (_) in
//                if let field:UITextField = alertController.textFields![0] {
//                    // store your data
//                    NSUserDefaults.standardUserDefaults().setObject(field.text, forKey: "userEmail")
//                    NSUserDefaults.standardUserDefaults().synchronize()
//                }
//            }
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
//            
//            //add the input field
//            alertController.addTextFieldWithConfigurationHandler { (textField) in
//                textField.placeholder = "Email"
//            }
//            
//            alertController.addAction(confirmAction)
//            alertController.addAction(cancelAction)
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func didForgetPassoword(sender: AnyObject) {
        //TODO handle forget password
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

