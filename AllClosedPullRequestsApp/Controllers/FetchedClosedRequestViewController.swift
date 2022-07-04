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
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: Variables
    
    var model: [FetchedClosedRequestViewModel]? = []
    
    
    // MARK: LifeCycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateClosedRequestModel()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.closedRequestTableView.reloadData()
    }
    
    // MARK: Actions
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: Functions
    func setupUI() {
        closedRequestTableView.delegate = self
        closedRequestTableView.dataSource = self
        self.loadingView.isHidden = false
        self.titleLabel.text = "All Closed Pull Requests"
        self.backButton.setImage(UIImage(named: "backButtonImage"), for: .normal)
        self.closedRequestTableView.register(UINib(nibName: "FetchedClosedRequestTableViewCell", bundle: nil), forCellReuseIdentifier: "FetchedClosedRequestTableViewCell")
        self.closedRequestTableView.estimatedRowHeight = 100
        self.closedRequestTableView.rowHeight = UITableView.automaticDimension
    }
    
    func updateClosedRequestModel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            if let requestModel = RequestModel.shared.requestModel {
                for i in 0..<requestModel.count {
                    if(requestModel[i].state == "closed") { // TODO:
                        let currentRequestModel = FetchedClosedRequestViewModel(requestTitle: requestModel[i].title, username: requestModel[i].user.login, userImage: requestModel[i].user.avatarURL, createdDate: requestModel[i].createdAt, closedDate: requestModel[i].closedAt ?? "")
                        self?.model?.append(currentRequestModel)
                    }
                }
            }
            self?.closedRequestTableView.reloadData()
            self?.loadingView.isHidden = true
        }
    }
    
}

extension FetchedClosedRequestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FetchedClosedRequestTableViewCell", for: indexPath) as? FetchedClosedRequestTableViewCell {
            if let model = model?[indexPath.row] {
                cell.model = model
                cell.setupCell()
            }
            return cell
        }
        return UITableViewCell()
    }
}
