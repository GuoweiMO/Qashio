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
    
    @IBOutlet weak var RegisterBtn: UIButton!
    var scrollView: UIScrollView = UIScrollView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view  = scroller
//        scroller.scrollEnabled = true
        scrollView.contentSize = CGSizeMake(320, 900)
    }
    @IBAction func verifyUerRegistration(sender: AnyObject) {
        if true{
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
            self.showViewController(vc as! UIViewController, sender: vc);
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
