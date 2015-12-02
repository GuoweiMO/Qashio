//
//  LandingViewController.swift
//  Raketten
//
//  Created by Guowei Mo on 25/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var landingLoginBtn: UIButton!
    @IBOutlet weak var landingRegisterBtn: UIButton!
    @IBOutlet weak var introPageControl: UIPageControl!
    var imageScrollView: UIScrollView!
    let imageArray = ["intro_1","intro_2","intro_3"]
    var originX:Int?
    var originY:Int?
    var width:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        landingLoginBtn.layer.cornerRadius = 5
        landingRegisterBtn.layer.cornerRadius = 5
        width = Int(UIScreen.mainScreen().bounds.width - 60)
        
        createScrollView()
        createScrollingPages()
        initPageCtrl()
    }
    
    func createScrollView(){
        imageScrollView = UIScrollView()
        imageScrollView.frame = CGRect(x: 30, y: 150, width: width!, height: width!)
        imageScrollView.contentSize = CGSize(width: width!, height: width!)
        imageScrollView.delegate = self
        imageScrollView.pagingEnabled = true
        imageScrollView.showsVerticalScrollIndicator = false
        imageScrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(imageScrollView)
    }
    
    func createScrollingPages(){
        for(var i = 0; i < imageArray.count; i++)
        {
            //let image = UIImage(named: imageArray[i]);
            let imageView = UIImageView(image: UIImage(named: imageArray[i]))
            imageView.frame = CGRect(x: Int(width!)*i, y: 0, width: Int(width!), height:Int(width!))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageScrollView.addSubview(imageView)
            print(imageView.frame)
        }

    }
    
    func initPageCtrl(){
        imageScrollView.contentSize = CGSize(width: width!*3, height: width!);
        introPageControl.numberOfPages = imageArray.count
        introPageControl.addTarget(self, action: "changeInmage:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = imageScrollView.frame.size.width;
        let fractionalPage = CGFloat(imageScrollView.contentOffset.x) / pageWidth;
        let page = round(fractionalPage);
        introPageControl.currentPage = Int(page);
    }

    
    func changeInmage(sender: UIPageControl){
        let x = sender.currentPage*Int(imageScrollView.frame.size.width)
        imageScrollView.setContentOffset(CGPoint(x: x ,y: 0), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}