//
//  Locations.swift
//  Qashio
//
//  Created by Guowei Mo on 30/11/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import UIKit

class Locations: NSObject {
    var locations = Dictionary<String,[String]>()
    static let LocConf = Locations()
    
    override init() {
        super.init()
        locations = [
            "UK"    : ["London", "Birmingham", "Manchester", "Edingburgh", "Glasgow", "Belfast"],
            "US"    : ["Wahsington", "New York", "Los Angel", "Chicago", "San Francisco", "Seattle", "Huston"],
            "CN"    : ["Beijing", "Hong Kong", "Shanghai", "Guangzhou", "Shenzhen"]
        ]
    }
    
}
