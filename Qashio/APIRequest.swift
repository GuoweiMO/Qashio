
//
//  APIRequest.swift
//  Qashio
//
//  Created by Guowei Mo on 26/11/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func makePostRequest(baseUrl:String, params: [String:AnyObject]?){
        Alamofire.request(.POST, baseUrl, parameters: params)
            .responseJSON{ response in
                let dataResponse = (try! NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers)) as!NSDictionary
                print(dataResponse["results"]![1])
        }
    }
    
    
    func getPopEvents() {
        let baseUrl = "https://itunes.apple.com/search";
        let payLoad = ["term": "guowei"]
//        let payLoad = []
//        makeHTTPPostRequest(baseUrl, body: nil, onCompletion: {
//            json, error in
//            onCompletion(json as JSON)
//        })
        makePostRequest(baseUrl, params: payLoad)
        
    }
}
