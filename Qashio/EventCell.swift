//
//  EventCell.swift
//  Qashio
//
//  Created by Guowei Mo on 27/11/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UITableViewCell  {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellCategoryBtn: UIButton!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellVenueLabel: UILabel!
    @IBOutlet weak var numOfLikeLabel: UILabel!
//    @IBOutlet weak var cellDateBtn: UIButton!
    
    @IBOutlet weak var cellDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCategoryBtn.layer.cornerRadius = 15
//        cellDateBtn.layer.cornerRadius = 25
        
        cellDateLabel.clipsToBounds = true
        cellDateLabel.layer.cornerRadius = 25
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}