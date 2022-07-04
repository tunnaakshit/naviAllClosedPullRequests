//
//  ViewController.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 28/06/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var repoName: UITextField!
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    // MARK: Variables
    
    var networkClient = NetworkHandler()
    
    // MARK: LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
    }
    
    // MARK: Actions

    @IBAction func fetchingAllClosedPullRequests(_ sender: Any) {
        
        if let username = self.userName.text, let reponame = self.repoName.text, username != Constants.emptyString, reponame != Constants.emptyString {
            
            networkClient.getDataFromUrl(username: username, reponame: reponame)
            
            self.warningLabel.isHidden = true
            let storyboard = UIStoryboard(name: Constants.MainVCConstants.mainStoryBoard, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: Constants.MainVCConstants.fetchedClosedRequestViewController)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            self.warningLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.warningLabel.isHidden = true
            }
        }
    }
    
    // MARK: Functions
    
    func setupUI() {
        self.usernameLabel.text = Constants.MainVCConstants.username
        self.repoNameLabel.text = Constants.MainVCConstants.reponame
        self.warningLabel.layer.masksToBounds = true
        self.warningLabel.layer.cornerRadius = 10
        self.warningLabel.text = Constants.MainVCConstants.warningText
        self.warningLabel.isHidden = true
        self.fetchButton.layer.masksToBounds = true
        self.fetchButton.layer.cornerRadius = 5
    }

}

