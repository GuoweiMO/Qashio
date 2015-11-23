//
//  CategoryViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 30/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryScrollView: UIScrollView!
    @IBOutlet var conferenceCategories: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categoryScrollView.contentSize = CGSizeMake(375, 1800)
    }
    
    @IBAction func didExpandSubCategories(sender: UIButton) {
        print("button tapped");
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.TransitionNone ,
            animations: {
                sender.frame = CGRect(x: 10.0, y: sender.frame.origin.y, width: sender.frame.size.width, height: sender.frame.size.height)
                sender.translatesAutoresizingMaskIntoConstraints = true
            },
            completion: nil)
        
        for btn in self.conferenceCategories{
            if btn === sender {
                btn.frame = sender.frame
            }
        }
        
        print(sender.frame)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}