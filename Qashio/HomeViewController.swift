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
        
        let panRecogniser = UIPanGestureRecognizer(target: self, action: "handleOnPan:")
        self.view.addGestureRecognizer(panRecogniser)
        
        let refreshControl = UIRefreshControl()
        self.homeTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: "refreshAllEvents:", forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
//        if self.navigationController != nil {
////            self.navigationController?.setNavigationBarHidden(false, animated: true)
//            self.navigationItem.hidesBackButton = true
//            self.navigationItem.title = "All Events"
//        } else{
//            let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44)) 
//        }
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    func refreshAllEvents(sender: UIRefreshControl){
        //TODO reload the table data
        sender.endRefreshing()
    }
    func handleOnPan(gesture: UIGestureRecognizer){
        print("You dragged the table")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2 //hard code, only display top 10
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:UIView = UIView()
        let monthBackGroundView:UIImageView = UIImageView(image: UIImage(named: "month_oval"))
        monthBackGroundView.frame = CGRect(x: 0, y: 10,width: 70, height: 60)
        let monthLabel:UILabel = UILabel()
        monthLabel.text = "DEC"
        monthLabel.frame = CGRect(x: 23, y: 1, width: 58, height: 58)
        monthBackGroundView.addSubview(monthLabel)
        headerView.addSubview(monthBackGroundView)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return self.events.count
        return 6
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
//        cell?.numOfLikeLabel.text = "❤️"
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show_event_detail" {
            let eventDetailVC:EventDetailViewController = segue.destinationViewController as! EventDetailViewController
            let eventIndex = homeTableView!.indexPathForSelectedRow!.row
//            let eventItem = self.EventList[eventIndex]
//            eventDetailVC.eventItem = eventItem

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

