//
//  FetchedClosedRequestViewController.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 29/06/22.
//

import Foundation
import UIKit

class FetchedClosedRequestViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closedRequestTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: Variables
    
    var model: FetchedClosedRequestViewModel?
    
    // MARK: LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.titleLabel.text = "All Closed Pull Requests"
        self.backButton.setImage(UIImage(named: "backButtonImage"), for: .normal)
        
    }
    
    // MARK: Actions
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
