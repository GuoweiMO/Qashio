//
//  EventDetailViewController.swift
//  Qashio
//
//  Created by Guowei Mo on 11/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var contentRect:CGRect = CGRectZero
        for view in mainScrollView.subviews as [UIView] {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        mainScrollView.contentSize = contentRect.size

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

}
