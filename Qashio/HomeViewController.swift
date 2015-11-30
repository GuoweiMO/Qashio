//
//  FirstViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 21/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "All Events"
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //hard code, only display top 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return self.events.count
        return 10
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("home_event_cell") as! EventCell?
        
        if cell == nil {
            cell = EventCell(style: UITableViewCellStyle.Default, reuseIdentifier: "home_event_cell")
        }
        
        cell?.cellImage.image = UIImage(named: "sampe_event_bg")
        cell?.cellNameLabel.text = "Apple"
        cell?.cellVenueLabel.text = "1 Infinite Loop, Cupertino, CA 95014"
        cell?.cellDateLabel.text = String(indexPath.row+1)
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

