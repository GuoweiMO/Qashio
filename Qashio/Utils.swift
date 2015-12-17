//
//  Utils.swift
//  Qashio
//
//  Created by Guowei Mo on 15/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation

class Utils: AnyObject {
    static func validateEmailFormat(username:String) -> Bool{
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluateWithObject(username)
    }
}