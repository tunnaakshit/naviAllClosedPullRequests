//
//  RequestModel.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation

typealias AllRequests = [Request]

// MARK: - WelcomeElement
struct Request: Codable {
    let state, title: String
    let user: User
    let createdAt: String
    let closedAt: String?

    enum CodingKeys: String, CodingKey {
        case state, title, user
        case createdAt = "created_at"
        case closedAt = "closed_at"
    }
}

// MARK: - User
struct User: Codable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

class RequestModel: NSObject {
    
    @objc static let shared = RequestModel()
    
    var requestModel: AllRequests?

    func update(model: AllRequests?)  {
        if let model = model {
            self.requestModel = model
        }
    }
}

