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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categoryScrollView.contentSize = CGSizeMake(375, 1800)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}