//
//  ViewController.swift
//  AllClosedPullRequestsApp
//
//  Created by Akshit Sharma on 28/06/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var repoName: UITextField!
    @IBOutlet weak var fetchButton: UIButton!
    
    // MARK: Variables
    
    // MARK: LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions

    @IBAction func fetchingAllClosedPullRequests(_ sender: Any) {
        
    }

}

