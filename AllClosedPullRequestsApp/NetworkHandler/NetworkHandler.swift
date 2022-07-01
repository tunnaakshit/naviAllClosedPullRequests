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
        
        let url = "https://api.github.com/repos/tunnaakshit/DemoImplementation/pulls?state=all"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
//                print(data)
                do {
                    let model = try JSONDecoder().decode(AllRequests.self, from: data)
                    RequestModel.shared.update(model: model)
                } catch {
                    print("JsonDecoderError: ",error)
                }
                
            case .failure(_):
                print(response.error)
            }
            
            
            
        }
    }
}

