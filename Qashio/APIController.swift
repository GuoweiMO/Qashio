//
//  APIController.swift
//  Qashio
//
//  Created by Guowei Mo on 08/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation
import Alamofire

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APIController {
    
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    func httpPost(path: String, parameters params: Dictionary<String,AnyObject>?) {
        if params != nil {
            Alamofire.request(.POST, path, parameters: params)
                .responseJSON{ response in
                    print(response.result)
                    print(response.request)
                    let dataResponse = (try! NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                    
                    print(dataResponse)
                    self.delegate.didReceiveAPIResults(dataResponse)
            }
        }
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            print("Task completed")
//            if(error != nil) {
//                // If there is an error in the web request, print it to the console
//                print(error!.localizedDescription)
//            }
//            let err: NSError? = nil
//            print(data!)
//            let result = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
//            print(result)
//            if(err != nil) {
//                // If there is an error parsing JSON, print it to the console
//                print("JSON Error \(err!.localizedDescription)")
//            }
//            self.delegate.didReceiveAPIResults(result)
//        })
//        task.resume()
    }
    
    func verifyLogin(params: Dictionary<String,AnyObject>) {
        let path = "http://198.100.146.69:8080/QashioAPI-1.0/verify"
        httpPost(path, parameters: params)
    }
    
    func registerNewUser(params: Dictionary<String,AnyObject>) {
        let path = "http://198.100.146.69:8080/QashioAPI-1.0/verify"
        httpPost(path, parameters: params)
    }
    
}