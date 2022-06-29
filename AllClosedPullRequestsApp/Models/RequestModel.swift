//
//  RequestModel.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation

class RequestModel: NSObject {
    
    @objc static let shared = RequestModel()
    
    @objc func update(json:[String:Any])  {
        
        if let url = json["url"] {
            print(url)
        }
        
    }
}
