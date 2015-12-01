
//
//  APIRequest.swift
//  Qashio
//
//  Created by Guowei Mo on 26/11/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation

typealias ServiceReponse = (JSON, NSError?) -> Void

class APIRequest: NSObject{
    static let APIInstance = APIRequest()
    
    func makeHTTPPostRequest(baseUrl:String, body:[String:AnyObject]?, onCompletion: ServiceReponse){
        let request = NSMutableURLRequest(URL: NSURL(string: baseUrl)!)
        request.HTTPMethod = "POST"
        
        do{
            if body != nil {
                request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(body!, options: NSJSONWritingOptions.PrettyPrinted)
            }
        }
        catch _ as NSError {
        }
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            let result:JSON = JSON(data:data!)
            onCompletion(result, error)
        })
        task.resume()
    }
    
    func getPopEvents(onCompletion: (JSON) -> Void){
        let baseUrl = "https://itunes.apple.com/search?term=guowei";
//        let payLoad = ["term": "guowei"]
//        let payLoad = []
        makeHTTPPostRequest(baseUrl, body: nil, onCompletion: {
            json, error in
            onCompletion(json as JSON)
        })
    }
}