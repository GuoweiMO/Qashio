//
//  EventsSumViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 30/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class EventSumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPopoverPresentationControllerDelegate{
    
    var selecedCategories:String = ""

    var events = NSMutableArray()
    var blurView:UIView = UIView()
    var screenFrame:CGRect = CGRect()
    let UKCities = Locations.LocConf.locations["UK"]
    var allCitiesBtn = MoButton()
    
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
    }
    
    @IBAction func willGenerateHomeEvents(sender: AnyObject) {
        print("you click see all button");
        
        //after a few processing
        let vc:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("mainNav")
//        vc.navigationItem.hidesBackButton = true
//        vc.navigationController?.setNavigationBarHidden(true, animated: true)
//        vc.navigationItem.title = "All Events"
        self.presentViewController(vc, animated: true, completion: nil);
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "pickCitiesSegue" {
//            let popoverViewController = segue.destinationViewController
//            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
//            popoverViewController.preferredContentSize = CGSize(width: 150, height: 400)
//            popoverViewController.popoverPresentationController!.delegate = self
//        }
//    }
//    
//    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.None
//    }
    
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
            
            UIView.transitionWithView(
                self.view,
                duration: 1,
                options: UIViewAnimationOptions.TransitionNone,
                animations: {
                    self.view.addSubview(blurEffectView)
                }, completion: nil)
            
            let fixedX = Int(screenFrame.maxX - 140)
            
            allCitiesBtn = MoButton(frame: CGRect(x: fixedX, y: 50 , width: 120, height: 30))
            allCitiesBtn.backgroundColor = UIColor.yellowColor()
            allCitiesBtn.setTitle("All Cities", forState: .Normal)
            allCitiesBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            allCitiesBtn.layer.cornerRadius = 15
            allCitiesBtn.layer.borderColor = UIColor.yellowColor().CGColor
            allCitiesBtn.layer.borderWidth = 2

            allCitiesBtn.addTarget(self, action: "didSelectAllCities:", forControlEvents: .TouchUpInside)
            
            
            blurEffectView.addSubview(allCitiesBtn)
            
            for(var i=0; i < UKCities?.count; i++){
                let btn:MoButton = MoButton(frame: CGRect(x: fixedX, y: 90+40*i , width: 120, height: 30))
                btn.backgroundColor = UIColor.clearColor()
                btn.layer.borderColor = UIColor.yellowColor().CGColor
                btn.layer.borderWidth = 2
                btn.setTitle(UKCities![i], forState: .Normal)
                btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                btn.layer.cornerRadius = 15
                btn.btnSeleted = false
                blurEffectView.addSubview(btn)
                btn.addTarget(self, action: "didToggleSelectCity:", forControlEvents: .TouchUpInside)
            }
            
            let closeBtn:UIButton = UIButton(frame: CGRect(x: 10, y: 10 , width: 30, height: 30))
            closeBtn.setTitle("X", forState: .Normal)
            
            blurEffectView.addSubview(closeBtn)
            closeBtn.addTarget(self, action: "didCloseBlurbView:", forControlEvents: .TouchUpInside)

        }
        else {
            self.view.backgroundColor = UIColor.clearColor()
        }
    }
    
    func didToggleSelectCity(sender:MoButton){
        toggleBtn(sender)
        if sender.btnSeleted {
            allCitiesBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            allCitiesBtn.backgroundColor = UIColor.clearColor()
            allCitiesBtn.btnSeleted = false
        }

    }
    
    func didSelectAllCities(sender:MoButton){
        toggleBtn(sender)
        if sender.btnSeleted {
            //make all other buttons unseletcted
        } else{
            
        }
    }
    
    func toggleBtn(sender:MoButton){
        if !sender.btnSeleted {
            sender.setTitleColor(UIColor.blackColor(), forState: .Normal)
            sender.backgroundColor = UIColor.yellowColor()
            sender.btnSeleted = true
        } else{
            sender.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            sender.backgroundColor = UIColor.clearColor()
            sender.btnSeleted = false
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
        cell?.numOfLikeLabel.text = "❤️" + String(500 - indexPath.row)
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}