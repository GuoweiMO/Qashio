//
//  RegisterViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
//    var scrollView:UIScrollView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var socialMediaBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    var baseScrollHeight:CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        scrollView.contentSize = CGSizeMake(375,1200);
        
        var contentRect:CGRect = CGRectZero;
        for view in scrollView.subviews as [UIView] {
            contentRect = CGRectUnion(contentRect, view.frame);
        }
        scrollView.contentSize = contentRect.size;
        
        socialMediaBtn.layer.cornerRadius = 5
        registerBtn.layer.cornerRadius = 5
        emailField.delegate = self
        passwordField.delegate = self
        
        baseScrollHeight = scrollView.contentSize.height
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardDidShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardDidHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification){
        scrollView.contentSize.height = baseScrollHeight!
        let keyboardHeight:CGFloat = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue.height
        print("keyboard shows",keyboardHeight)
        scrollView.contentSize.height += keyboardHeight
    }
    
    func keyboardDidHide(notification: NSNotification){
        scrollView.contentSize.height = baseScrollHeight!
        let keyboardHeight:CGFloat = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue.height
        print("keyboard hides",keyboardHeight)
        scrollView.contentSize.height -= keyboardHeight
    }
    
    @IBAction func uploadSelfImage(sender: AnyObject) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        scrollView.contentSize.height = baseScrollHeight!
        return true
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
