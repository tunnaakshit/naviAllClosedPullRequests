//
//  FetchedClosedRequestTableViewCell.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation
import UIKit

class FetchedClosedRequestTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var requestTitle: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var closedSate: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    // MARK: Variables
    
    var model: FetchedClosedRequestViewModel?
    
    // MARK: LifeCycle Functions
    
    // MARK: Functions
    
    func setupCell(requestTitle: String, createdDate: String, closedDate: String, userImage: UIImage?, username: String) {
        self.requestTitle.text = requestTitle
        self.createdDate.text = createdDate
        self.closedSate.text = closedDate
        if let userImage = userImage {
            self.userImageView.image = userImage
        } else {
            self.userImageView.image = UIImage(named: "")
        }
        self.usernameLabel.text = username
    }
}
