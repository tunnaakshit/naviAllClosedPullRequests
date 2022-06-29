//
//  ViewController.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 28/06/22.
//

import UIKit

///https://api.github.com/repos/tunnaakshit/DemoImplementation/pulls?state=all

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var repoName: UITextField!
    @IBOutlet weak var fetchButton: UIButton!
    
    // MARK: Variables
    
    // MARK: LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.usernameLabel.text = "Username"
        self.repoNameLabel.text = "Repo Name"
        
    }
    
    // MARK: Actions

    @IBAction func fetchingAllClosedPullRequests(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FetchedClosedRequestViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }

}

