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
        
        setupUI()
        
    }
    
    // MARK: Actions
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: Functions
    func setupUI() {
        closedRequestTableView.delegate = self
        closedRequestTableView.dataSource = self
        self.titleLabel.text = "All Closed Pull Requests"
        self.backButton.setImage(UIImage(named: "backButtonImage"), for: .normal)
        self.closedRequestTableView.register(UINib(nibName: "FetchedClosedRequestTableViewCell", bundle: nil), forCellReuseIdentifier: "FetchedClosedRequestTableViewCell")
        self.closedRequestTableView.estimatedRowHeight = 100
        self.closedRequestTableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension FetchedClosedRequestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FetchedClosedRequestTableViewCell", for: indexPath) as? FetchedClosedRequestTableViewCell {
            cell.setupCell(requestTitle: "AS-0000 : Akshit", createdDate: "09/04/1998", closedDate: "01/01/2001", userImage: UIImage(named: "backButtonImage"), username: "Akshit Sharma")
            return cell
        }
        return UITableViewCell()
    }
}
