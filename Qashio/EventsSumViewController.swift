//
//  EventsSumViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 30/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class EventSumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selecedCategories:String = ""

    var events = NSMutableArray()
    
    @IBOutlet weak var monthLabelDecorator: UIView!
    @IBOutlet weak var eventsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        monthLabelDecorator.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(animated: Bool) {
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        addEventsData()
        
    }
    
    func addEventsData(){
        APIRequest.APIInstance.getPopEvents({
            json in
            print(json)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.eventsTableView.reloadData()
            })
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.events.count
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("event_cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "event_cell")
        }
        
//        cell?.backgroundView = UIImageView(image: UIImage(named: "sampe_event_bg"))
        
        cell?.textLabel?.text = "👻南瓜车"
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}