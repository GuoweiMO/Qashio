
//
//  User.swift
//  Qashio
//
//  Created by Guowei Mo on 14/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation

class EventUser: NSObject {
    
    var userName: String?
    var password: String?
    var printedName: String?
    var jobTitle: String?
    var company: String?
    var industry: String?
    var socialMedia: Dictionary<String, String>?
    var preferredCategories: Dictionary<String,String>? {
        didSet {
            
        }
    }
    
    init(userName: String){
        self.userName = userName
    }
}