//
//  server.swift
//  swift_test
//
//  Created by Farid Fadaie on 2014-07-19.
//  Copyright (c) 2014 farid fadaie. All rights reserved.
//

import UIKit
import Foundation

class Server{
    
    let domain = "url"
    init(){
        //println("hi")
    }
    
    
    func call(name : String, callback : AnyObject -> Void){
        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let task = session.dataTaskWithRequest(NSURLRequest(URL:NSURL(string: self.domain + name)), completionHandler: {(data, response, error) in
            var error: NSError?
            if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSDictionary{
                if (jsonDict["type"] as String == "error") && (jsonDict["code"] as String == "100"){
                    func loop(x : AnyObject){
                        self.call(name, callback)
                    }
                    self.call("user/login?phone=%2Bphone&password=pass",loop)
                }else{
                    callback(jsonDict)
                }
            }else{
                if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSArray{
                    callback(jsonDict)
                }else{
                    println("goozidim")
                }
                
            }
            })
        task.resume()
    }

}
