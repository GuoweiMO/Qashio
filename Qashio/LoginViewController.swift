//
//  LoginViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit
import Alamofire

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
        
        let result = checkUserInfoWithUserName(userName.text!, userPassword: passWord.text!)
        
        print(result!["success"]!)
        if  result != nil && Bool(result!["success"]! as! NSNumber) == true {
            //check against the data in db
                localData.setValue(userName.text!, forKey: "USER_NAME");
                localData.setValue(passWord.text!, forKey: "PASSWORD");
            
                let vc:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
                self.showViewController(vc, sender: vc);
        } else{
            let alert:UIAlertController = UIAlertController(title: "ERROR" , message: String(result!["msg"]!), preferredStyle: UIAlertControllerStyle.Alert)
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
    
    func checkUserInfoWithUserName(username: String, userPassword password: String) -> Dictionary<String, AnyObject>?{
        
        let params = [
            "username"  : username,
            "password"  : password,
            "type"      : "check"
        ]
        Alamofire.request(.POST, "http://198.100.146.69:8080/QashioAPI-1.0/verify", parameters: params)
            .responseJSON{ response in
                print(response.result)
                print(response.request)
                let dataResponse = (try! NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary

                print(dataResponse)
        }

        var result = Dictionary<String, AnyObject>()

        let temV = arc4random_uniform(100)%3
        print(temV)
        if  temV == 0 {
            result = [
                "success"   : false,
                "msg"       : "user does not exist"
            ]
        } else if  temV == 1{
            result = [
                "success"   : false,
                "msg"       : "the password is not correct for the user"
            ]
        }else{
            result = [
                "success"   : true,
                "msg"       : ""
            ]
        }
        
        if username.isEmpty && password.isEmpty{
        
        }
        
        return result
    }
 
    
    @IBAction func didForgetPassoword(sender: AnyObject) {
        //TODO handle forget password
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

