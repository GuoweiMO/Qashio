//
//  EventItem.swift
//  Qashio
//
//  Created by Guowei Mo on 14/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation

class EventItem: AnyObject {
    //required properties
    var id:String?
    var name:String?
    var venue:String?
    var startTime:String?
    var endTime:String?
    var category: String?
    var categoryId: String?
    
    //secondary properties
    var images:[String]?
    var speakers:Dictionary<Int, String>?
    var attendees: Dictionary<Int, String>?
    var agenda:String?
    var cost:String?
    
    init(){
        
    }
    
    
}