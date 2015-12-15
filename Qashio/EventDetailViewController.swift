//
//  EventDetailViewController.swift
//  Qashio
//
//  Created by Guowei Mo on 11/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var speakersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var contentRect:CGRect = CGRectZero
        for view in mainScrollView.subviews as [UIView] {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        mainScrollView.contentSize = contentRect.size
        
        speakersCollectionView.dataSource = self
        speakersCollectionView.delegate = self
        speakersCollectionView.pagingEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let speakerCell = collectionView.dequeueReusableCellWithReuseIdentifier("event_speaker_cell", forIndexPath: indexPath) as! UserInfoCell
        speakerCell.userImageButton.setBackgroundImage(UIImage(named: "logo-1"), forState: .Normal)
        speakerCell.userNameLabel.text = "Steve Jobs"
        speakerCell.userTitleLabel.text = "CEO of Apple"
        
        return speakerCell
    }

}
