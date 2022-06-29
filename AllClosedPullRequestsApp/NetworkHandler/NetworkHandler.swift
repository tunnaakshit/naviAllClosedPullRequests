//
//  NetworkHandler.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation
import Alamofire

class NetworkHandler {
    
    // MARK: Functions
    func getDataFromUrl() {
        
        let url = "https://api.github.com/repos/tunnaakshit/DemoImplementation/pulls"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let json = self.dataToJSON(data: data) {
                    print(json)
                    RequestModel.shared.update(json: json as! [String : Any])
                }
                
            case .failure(_):
                print(response.error)
            }
            
            
            
        }
    }
    
   
    func dataToJSON(data: Data) -> [String : Any]? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }
}

