//
//  LoginViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, APIControllerProtocol {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    var API : APIController?
    var localData : AnyObject?
    var loginResults:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.layer.cornerRadius = 5
        registerBtn.layer.cornerRadius = 5
        API = APIController(delegate: self)
    }
    
    @IBAction func verifyUserLogin(sender: AnyObject) {
        print("userName: " + userName.text!)
        print("password: " + passWord.text!)
        localData = NSUserDefaults.standardUserDefaults()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        let storedUserName = localData!.valueForKey("USER_NAME") as? String //as? return nil or String
        let storedPassword = localData!.valueForKey("PASSWORD") as? String
        
        if storedUserName != nil && !storedPassword!.isEmpty && storedPassword != nil && !storedPassword!.isEmpty {
            print("saved userName: " + storedUserName!)
            print("saved password: " + storedPassword!)
        }
        
        let params = [
            "username"  : userName.text!,
            "password"  : passWord.text!,
            "type"      : "check"
        ]
        if Utils.validateEmailFormat(userName.text!) {
            API?.verifyLogin(params)
        } else{
            AlertController.presentErrorAlert(self, msg: "Your UserName is not a valid email address")
        }
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        //        dispatch_async(dispatch_get_main_queue(), {
        self.loginResults = results
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        //        })
        renderLoginResult()
    }
    
    func renderLoginResult(){
        var errorMsg = ""
        if self.loginResults != nil {
            if (self.loginResults!["success"]! as! NSNumber) == true {
                //check against the data in db
                localData!.setValue(userName.text!, forKey: "USER_NAME")
                localData!.setValue(passWord.text!, forKey: "PASSWORD")
                
                let vc:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
                self.showViewController(vc, sender: vc);
            } else{
                errorMsg = String(self.loginResults!["msg"]!)
                if errorMsg.isEmpty {
                    errorMsg = "Unable to Log in."
                }
            }
        } else {
            errorMsg = "Network Error. Please try again."
        }
        
        if !errorMsg.isEmpty {
            AlertController.presentErrorAlert(self,msg: errorMsg)
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

