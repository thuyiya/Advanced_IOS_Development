//
//  ViewController.swift
//  faceid
//
//  Created by thusitha on 8/16/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func athunticate(_ sender: Any) {
        
    let context = LAContext()
    var error: NSError?

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Identify yourself!"

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
            [weak self] success, authenticationError in

            DispatchQueue.main.async {
                if success {
                    let ac = UIAlertController(title: "Authentication success", message: "Well Done", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Happy", style: .default))
                    self?.present(ac, animated: true)
                } else {
                    let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                }
            }
        }
    } else {
        let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }
    }
    
}

