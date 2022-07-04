//
//  Constants.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 04/07/22.
//

import Foundation

struct Constants {
    
    static let emptyString = ""
    
    struct MainVCConstants {
        static let mainStoryBoard = "Main"
        static let fetchedClosedRequestViewController = "FetchedClosedRequestViewController"
        static let username = "User Name"
        static let reponame = "Repo Name"
        static let warningText = "WARNING: - Either of the Username or Reponame field is empty. Please enter the desired Username and reponame."
    }
    
    struct FetchedClosedRequestVCConstants {
        static let errorText = "Sorry! Could not fetch details with the given Username and Reponame. Please try again with correct credentials."
        static let labelText = "All Closed Pull Requests"
        static let backButtonImage = "backButtonImage"
        static let fetchedClosedRequestTableViewCell = "FetchedClosedRequestTableViewCell"
        static let closedState = "closed"
    }
    
    struct FetchedClosedRequestCellConstants {
        static let imageError = "defaultImageError"
    }
    
    struct NetworkHandlerConstants {
        static let baseUrl = "https://api.github.com/repos/"
        static let endPoint = "/pulls?state=all"
    }
}
