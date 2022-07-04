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
    
    func setupCell() {
        self.requestTitle.text = self.model?.requestTitle
        self.createdDate.text = self.model?.createdDate
        self.closedSate.text = self.model?.closedDate
        if let userImage = self.model?.userImage {
            guard let url = URL(string: userImage) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                if let imageData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.userImageView.image = loadedImage
                    }
                }
            }
        } else {
            self.userImageView.image = UIImage(named: "") // TODO:
        }
        self.usernameLabel.text = self.model?.username
    }
}
