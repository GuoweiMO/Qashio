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
    var blurView:UIView = UIView()
    var screenFrame:CGRect = CGRect()
    
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var pickCityBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickCityBtn.layer.cornerRadius = 10
        
        screenFrame = UIScreen.mainScreen().bounds;
    }
    
    override func viewWillAppear(animated: Bool) {
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        addEventsData()
        
    }
    @IBAction func willGenerateHomeEvents(sender: AnyObject) {
        print("you click see all button");
        
        //after a few processing
        
        let vc:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
//        vc.navigationItem.hidesBackButton = true
//        vc.navigationItem.title = "All Events"

        self.showViewController(vc, sender: vc);
    }
    
    @IBAction func didShowAllCities(sender: AnyObject) {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.view.backgroundColor = UIColor.whiteColor()

            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            
            self.blurView = blurEffectView
            self.view.addSubview(blurEffectView)
            
            let fixedX = Int(screenFrame.maxX - 130)
            
            for(var i=0; i < 5; i++){
                let btn:UIButton = UIButton(frame: CGRect(x: fixedX, y: 50+50*i , width: 100, height: 30))
                btn.backgroundColor = UIColor.orangeColor()
                btn.setTitle("London", forState: .Normal)
                btn.layer.cornerRadius = 5
                blurEffectView.addSubview(btn)
            }
            
            let closeBtn:UIButton = UIButton(frame: CGRect(x: 10, y: 10 , width: 30, height: 30))
            closeBtn.setTitle("X", forState: .Normal)
            closeBtn.addTarget(self, action: "didCloseBlurbView:", forControlEvents: .TouchUpInside)
            
            blurEffectView.addSubview(closeBtn)
        }
        else {
            self.view.backgroundColor = UIColor.clearColor()
        }
    }
    
    func didCloseBlurbView(sender:UIButton){
        for itemView:UIView in self.blurView.subviews {
            itemView.removeFromSuperview()
        }
        
        if self.blurView.isKindOfClass(UIVisualEffectView) {
            self.blurView.removeFromSuperview()
        }
        self.view.backgroundColor = UIColor.whiteColor()
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
        return 1 //hard code, only display top 10
    }
    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 20
//    }
    
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view:UIView = UIView()
//        view.backgroundColor = UIColor.clearColor()
//        return view
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.events.count
        return 10
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("event_cell") as! EventCell?
        
        if cell == nil {
            cell = EventCell(style: UITableViewCellStyle.Default, reuseIdentifier: "event_cell")
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