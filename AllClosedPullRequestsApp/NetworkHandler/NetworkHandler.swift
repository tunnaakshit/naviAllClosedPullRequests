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
    func getDataFromUrl(username: String, reponame: String) {
        
        let repoEndPoint = username + "/" + reponame
        
        let url = getUrl(repoEndPoint: repoEndPoint)
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
//                print(data)
                do {
                    let model = try JSONDecoder().decode(AllRequests.self, from: data)
                    RequestModel.shared.update(model: model)
                } catch {
                    print("JsonDecoderError: ",error)
                    RequestModel.shared.handleError()
                }
                
            case .failure(_):
                print(response.error)
            }
            
            
            
        }
    }
    
    func getUrl(repoEndPoint: String) -> String {
        let baseUrl = "https://api.github.com/repos/"
        let endpoint = "/pulls?state=all"
        let finalUrl = baseUrl + repoEndPoint + endpoint
        
        return finalUrl
    }
}

//"https://api.github.com/repos/tunnaakshit/DemoImplementation/pulls?state=all"
