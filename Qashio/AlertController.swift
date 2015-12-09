//
//  AlertController.swift
//  Qashio
//
//  Created by Guowei Mo on 09/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class AlertController: AnyObject {
    static func presentErrorAlert(target:AnyObject, msg:String?){
        let alert:UIAlertController = UIAlertController(title: "ERROR" , message: msg!, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        target.presentViewController(alert, animated: true, completion: nil)
    }
    
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