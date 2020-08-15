//
//  ViewController.swift
//  nibmdevelopmentone
//
//  Created by thusitha on 8/14/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    let expectedUserName = "nibm"
    let expectedPassword = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        password.delegate = self
        statusLabel.text = ""
        loadingActivity.hidesWhenStopped = true
    }
    
    @IBAction func login(_ sender: Any) {
        
        statusLabel.text = "Logging In"
        
        loadingActivity.startAnimating()
        
        guard let userName = userName.text, !userName.isEmpty,
            let password = password.text, !password.isEmpty else {
                presentAlert(with: "Missing Credentials", message: "Missing User Name Or Password")
                return
        }
        
        guard expectedUserName == userName else {
            presentAlert(with: "Invalid Credentials", message: "Invalid User Name")
            return
        }
        
        guard expectedPassword == password else {
            presentAlert(with: "Invalid Credentials", message: "Invalid Password")
            return
        }
        
        UserDefaults.standard.set(true, forKey: "loggedIn")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.statusLabel.text = "Logged In"
            self.loadingActivity.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func presentAlert(with title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertVC.addAction(.init(title: "Ok", style: .default, handler: nil))
        
        present(alertVC, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
