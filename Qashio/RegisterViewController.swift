//
//  RegisterViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
//    var scrollView:UIScrollView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var socialMediaBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let fullScreenRect:CGRect = UIScreen.mainScreen().bounds;
//        
//        let scrollView:UIScrollView = UIScrollView.init(frame: fullScreenRect);
//        scrollView.contentSize = CGSizeMake(320,1100);
//        self.view = scrollView;
//        self.view.backgroundColor = UIColor.yellowColor();
        
//        scrollView = UIScrollView.init();
        scrollView.contentSize = CGSizeMake(375,1200);
        socialMediaBtn.layer.cornerRadius = 5
        registerBtn.layer.cornerRadius = 5
    }
    
    @IBAction func uploadSelfImage(sender: AnyObject) {
        
    }
    
    @IBAction func processUserSignup(sender: AnyObject) {
        let userEmail:String? = emailField.text
        let userPassword:String? = passwordField.text
        let localData = NSUserDefaults.standardUserDefaults()

        if userEmail != nil && !userEmail!.isEmpty && userPassword != nil && !userPassword!.isEmpty {
            localData.setValue(userEmail, forKey: "USER_NAME");
            localData.setValue(userPassword, forKey: "PASSWORD");
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainCtrl")
            self.showViewController(vc as! UIViewController, sender: vc);
        } else{
            let alert:UIAlertController = UIAlertController(title: "ERROR" , message: "You have not filled all the required information", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
