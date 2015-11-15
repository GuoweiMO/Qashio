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
    }
    
    @IBAction func uploadSelfImage(sender: AnyObject) {
        
    }
    
    @IBAction func processUserSignup(sender: AnyObject) {
        let userEmail = emailField.text as String!
        let userPassword = passwordField.text as String!
        let localData = NSUserDefaults.standardUserDefaults()

        if userEmail != nil && userPassword != nil{
            localData.setValue(userEmail, forKey: "USER_NAME");
            localData.setValue(userPassword, forKey: "PASSWORD");
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainCtrl")
            self.showViewController(vc as! UIViewController, sender: vc);
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
