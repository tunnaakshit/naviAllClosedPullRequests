//
//  FetchedClosedRequestViewModel.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation
import UIKit

class FetchedClosedRequestViewModel {
    var requestTitle: String
    var username: String
    var userImage: UIImage?
    var createdDate: String
    var closedDate: String
    
    
    init(requestTitle: String, username: String, userImage: UIImage?, createdDate: String, closedDate: String) {
        self.requestTitle = requestTitle
        self.username = username
        self.userImage = userImage
        self.createdDate = createdDate
        self.closedDate = closedDate
    }
    
}
