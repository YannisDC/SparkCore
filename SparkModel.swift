//
//  SparkModel.swift
//  UIControls
//
//  Created by Yannis De Cleene on 18/11/14.
//  Copyright (c) 2014 Yannis De Cleene. All rights reserved.
//

import Foundation

public class SparkModel {
    let device_id = "DEVICE_ID"
    let access_token = "ACCESS_TOKEN"
    
    public init () {}
    
    public func sendJSONpost(function: String, parameters: String)
    {
        var request = NSMutableURLRequest(URL: NSURL(string: "https://api.spark.io/v1/devices/\(device_id)/\(function)")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        request.HTTPBody = "access_token=\(access_token)&args=\(parameters)".dataUsingEncoding(NSUTF8StringEncoding)
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
        })
        
        task.resume()
    }
}
