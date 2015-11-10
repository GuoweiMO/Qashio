//
//  FirstViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 21/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        monthLabel.text = self.getCurrentMonth()
    }
    
    func getCurrentMonth() -> String{
//        let date = NSDate()
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components(NSCalendarUnit.CalendarUnitMonth, fromDate: date)
        return "1"; //swift is nice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

