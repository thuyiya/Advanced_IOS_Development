//
//  MainTableView.swift
//  nibmdevelopmentone
//
//  Created by thusitha on 8/15/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class MainTableView: UITableViewController {
    @IBOutlet weak var downloadsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NIBM Music"
        
        downloadsCell.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            downloadsCell.isHidden = false
        } else {
            downloadsCell.isHidden = true
        }
    }
    
    @IBAction func showLogin(_ sender: Any) {
        
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? ViewController {
            present(loginVC, animated: true, completion: nil)
        }
    }

}
