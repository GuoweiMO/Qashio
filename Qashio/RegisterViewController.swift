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
    @IBOutlet weak var emailField: MoTextField!
    @IBOutlet weak var passwordField: MoTextField!
    @IBOutlet weak var nameField: MoTextField!
    @IBOutlet weak var companyField: MoTextField!
    @IBOutlet weak var jobTitleField: MoTextField!
    @IBOutlet weak var industryField: MoTextField!
    
    @IBOutlet weak var socialMediaBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var selfImageUploadBtn: UIButton!
    @IBOutlet weak var selfImageView: UIImageView!
    @IBOutlet weak var removeImageBtn: UIButton!
    
    var baseScrollHeight:CGFloat?
    var originalImage:UIImage?
    var API : APIController?
    let localData = NSUserDefaults.standardUserDefaults()
    var optionMenu:UIAlertController?

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
        nameField.delegate = self
        companyField.delegate = self
        jobTitleField.delegate = self
        industryField.delegate = self
        
        baseScrollHeight = scrollView.contentSize.height
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardDidShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardDidHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalImage = selfImageView.image
        
        API = APIController(delegate: self)
        let tapImage = UITapGestureRecognizer(target: self, action: "pushImageOption:")
        selfImageView.addGestureRecognizer(tapImage)
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
    func uploadSelfImage() {
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func createImageUploadActionSheet(){
        optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let addImageAction = UIAlertAction(title: "Add Image", style: .Default, handler: {
            (alert:UIAlertAction) in
            self.uploadSelfImage()
        })
        
        let removeImageAction = UIAlertAction(title: "Delete Image", style: .Default, handler: {
            (alert:UIAlertAction) in
            self.removeUploadedImage()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction) in
            print("Cancelled")
        })
        optionMenu?.addAction(addImageAction)
        optionMenu?.addAction(removeImageAction)
        optionMenu?.addAction(cancelAction)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selfImageView.contentMode = .ScaleToFill
        selfImageView.image = chosenImage
//        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func removeUploadedImage() {
        selfImageView.image = originalImage

    }
    
    func pushImageOption(sender: UITapGestureRecognizer){
        if optionMenu == nil {
            createImageUploadActionSheet()
        }
        self.presentViewController(optionMenu!, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let moTextField:MoTextField = textField as! MoTextField
        switch  moTextField {
            case self.emailField:
                self.passwordField.becomeFirstResponder()
                break
            case self.passwordField:
                self.nameField.becomeFirstResponder()
                break
            case self.nameField:
                self.companyField.becomeFirstResponder()
                break
            case self.companyField:
                self.jobTitleField.becomeFirstResponder()
                break
            case self.jobTitleField:
                self.industryField.becomeFirstResponder()
                break
            case self.industryField:
                self.processUserSignup(textField)
                break
            default:
            break
        }
        
        scrollView.contentSize.height = baseScrollHeight!
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        var rect = self.view.frame
        let pos = textField.frame
        if pos.origin.y >= rect.size.height - 90 {
            rect.origin.y -= 90
        }
        self.view.frame = rect
        UIView.commitAnimations()
    }
    
    
    @IBAction func processUserSignup(sender: AnyObject) {
        let userEmail:String? = emailField.text
        let userPassword:String? = passwordField.text

        if !userEmail!.isEmpty && !userPassword!.isEmpty {
            if Utils.validateEmailFormat(userEmail!) {
                let params = [
                    "username"  :  userEmail!,
                    "password"  :  userPassword!,
                    "type"      :  "add"
                ]
                API?.registerNewUser(params)
            } else{
                AlertController.presentErrorAlert(self, msg: "Your UserName is not a valid email address")
            }
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
