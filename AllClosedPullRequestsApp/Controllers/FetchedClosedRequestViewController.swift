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
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    
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
        self.loadingView.alpha = 0.8
        self.loadingView.layer.masksToBounds = true
        self.loadingView.layer.cornerRadius = 5
        self.seperatorView.backgroundColor = .black
        self.seperatorView.layer.masksToBounds = true
        self.seperatorView.layer.cornerRadius = 5
        self.seperatorView.alpha = 0.8
        self.errorLabel.layer.masksToBounds = true
        self.errorLabel.layer.cornerRadius = 5
        self.errorLabel.text = Constants.FetchedClosedRequestVCConstants.errorText
        self.errorView.isHidden = true
        self.titleLabel.text = Constants.FetchedClosedRequestVCConstants.labelText
        self.backButton.setImage(UIImage(named: Constants.FetchedClosedRequestVCConstants.backButtonImage), for: .normal)
        self.closedRequestTableView.register(UINib(nibName: Constants.FetchedClosedRequestVCConstants.fetchedClosedRequestTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.FetchedClosedRequestVCConstants.fetchedClosedRequestTableViewCell)
        self.closedRequestTableView.estimatedRowHeight = 100
        self.closedRequestTableView.rowHeight = UITableView.automaticDimension
    }
    
    func updateClosedRequestModel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if let requestModel = RequestModel.shared.requestModel {
                for i in 0..<requestModel.count {
                    if(requestModel[i].state == Constants.FetchedClosedRequestVCConstants.closedState) { // TODO:
                        let currentRequestModel = FetchedClosedRequestViewModel(requestTitle: requestModel[i].title, username: requestModel[i].user.login, userImage: requestModel[i].user.avatarURL, createdDate: requestModel[i].createdAt, closedDate: requestModel[i].closedAt ?? Constants.emptyString)
                        self?.model?.append(currentRequestModel)
                    }
                }
            } else {
                //Show error view
                self?.closedRequestTableView.isHidden = true
                self?.errorView.isHidden = false
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FetchedClosedRequestVCConstants.fetchedClosedRequestTableViewCell, for: indexPath) as? FetchedClosedRequestTableViewCell {
            if let model = model?[indexPath.row] {
                cell.model = model
                cell.setupCell()
            }
            return cell
        }
        return UITableViewCell()
    }
}
