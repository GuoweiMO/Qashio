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
    
    let categoryScrollView = UIScrollView()
    var cateBtns = [UIButton]()
    var centerPt:CGFloat = 0
    var categoryObj = Category()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createScrollView()
        createCategoryItems()
        
    }
    
    func createScrollView(){
        categoryScrollView.frame = UIScreen.mainScreen().bounds;
        self.view = categoryScrollView
        self.view.backgroundColor = UIColor(red: 255.0/255, green: 230.0/255, blue: 22.0/255, alpha: 1)
        centerPt = categoryScrollView.frame.width/2
    }
    
    func createCategoryItems(){
        print(centerPt)
//        for var i = 0; i < categoryObj.categoryData.count; i++ {
        var i = 0
        for categoryItem in categoryObj.categoryData {
            let cateBtn = UIButton()
            cateBtn.setImage(UIImage(named: "IT_ico") , forState: UIControlState.Normal)
            cateBtns.append(cateBtn)
            cateBtn.frame = CGRect(x: Int(centerPt-50) , y: 20+140*i, width:100, height: 100)
            cateBtn.setTitle(categoryItem.0, forState: .Normal ) //String(Int(arc4random_uniform(12)))
            let cateLabel = UILabel()
            cateLabel.text = categoryItem.0
            cateLabel.frame = CGRect(x: 0 , y: cateBtn.frame.origin.y+110, width: UIScreen.mainScreen().bounds.width, height: 20)
            cateLabel.textAlignment = NSTextAlignment.Center
            categoryScrollView.addSubview(cateBtn)
            categoryScrollView.addSubview(cateLabel)
            cateBtn.addTarget(self, action: "didExpandSubCategories:", forControlEvents: UIControlEvents.TouchUpInside)
            i++
        }
        
        var contentRect:CGRect = CGRectZero;
        for view in categoryScrollView.subviews as [UIView] {
            contentRect = CGRectUnion(contentRect, view.frame);
        }
        print(contentRect.size)
        categoryScrollView.contentSize = contentRect.size;

    }
    
    func didExpandSubCategories(sender: UIButton) {
        print("button tapped");

        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.TransitionNone,
            animations: {
                sender.frame = CGRect(x: 50.0, y: sender.frame.origin.y, width: sender.frame.size.width, height: sender.frame.size.height)
            },
            completion: { (value:Bool) in
                let btnRef = sender
                self.createSubCategoryItems(btnRef)
            }
        )
        
        print(sender.titleLabel?.text)
    }
    
    func createSubCategoryItems(parent:UIButton){
        var subCateBtns = [UIButton]()
        let originY = parent.frame.origin.y
        var btnContents = categoryObj.categoryData[parent.currentTitle!]
        let num = btnContents?.count
        for var i = 0; i < num!; i++ {
            print("subCate num: \(num)")
            let subBtn = MoButton()
            subCateBtns.append(subBtn)
            var xPos = Int(centerPt)
            if i==0 || i==num!-1{
                xPos -= 20
            }
            
            subBtn.parentBtn = parent.currentTitle!
            subBtn.btnSeleted = false
            
            subBtn.frame = CGRect(x: xPos, y: Int(originY)+25*i, width:120, height: 20)
            subBtn.backgroundColor = UIColor.orangeColor()
            subBtn.layer.cornerRadius = 10
            subBtn.setTitle(btnContents!.removeFirst(), forState: UIControlState.Normal)
            
            categoryScrollView.addSubview(subBtn)
            subBtn.addTarget(self, action: "didSelectSubCategories:", forControlEvents: UIControlEvents.TouchUpInside)
        }

    }
    
    func didSelectSubCategories(sender: MoButton){
        if sender.btnSeleted == false{
            sender.layer.borderWidth = 3
            sender.layer.borderColor! = UIColor.brownColor().CGColor
            sender.btnSeleted = true;
            categoryObj.addSelectedSubCategory(sender.parentBtn , subCategoryToAdd: sender.currentTitle!)
        } else{
            sender.layer.borderWidth = 0
            sender.layer.borderColor = UIColor.orangeColor().CGColor
            sender.btnSeleted = false
            categoryObj.removeunSelectedSubCategory(sender.parentBtn , subCategoryToRemove: sender.currentTitle!)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "completeSelection"){
            let eventSumVC:EventSumViewController = segue.destinationViewController as! EventSumViewController;
            eventSumVC.selecedCategories = "set up string"
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}