//
//  RegisterViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, APIControllerProtocol {
    
//    var scrollView:UIScrollView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var socialMediaBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var selfImageUploadBtn: UIButton!
    @IBOutlet weak var selfImageView: UIImageView!
    @IBOutlet weak var removeImageBtn: UIButton!
    
    var baseScrollHeight:CGFloat?
    var originalImage:UIImage?
    var API : APIController?
    let localData = NSUserDefaults.standardUserDefaults()

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
        
        originalImage = selfImageView.image
        
        API = APIController(delegate: self)
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
    
    /********************************
        Upload Image from Library
     ************************************/
    @IBAction func uploadSelfImage(sender: AnyObject) {
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selfImageView.contentMode = .ScaleToFill
        selfImageView.image = chosenImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func removeUploadedImage(sender: AnyObject) {
        selfImageView.image = originalImage

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        scrollView.contentSize.height = baseScrollHeight!
        return true
    }
    
    
    @IBAction func processUserSignup(sender: AnyObject) {
        let userEmail:String? = emailField.text
        let userPassword:String? = passwordField.text

        if !userEmail!.isEmpty && !userPassword!.isEmpty {
            let params = [
                "username"  :  userEmail!,
                "password"  :  userPassword!,
                "type"      :  "add"
                ]
                API?.registerNewUser(params)
            
            } else{
            AlertController.presentErrorAlert(self, msg: "You have not filled all the required information")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didReceiveAPIResults(results: NSDictionary) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false

        if (results["success"]! as! NSNumber) == true {
            localData.setValue(emailField.text, forKey: "USER_NAME");
            localData.setValue(passwordField.text, forKey: "PASSWORD");
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainCtrl")
            self.showViewController(vc as! UIViewController, sender: vc);
        }else{
            AlertController.presentErrorAlert(self, msg: results["msg"]! as? String)
        }

    }
    
}
