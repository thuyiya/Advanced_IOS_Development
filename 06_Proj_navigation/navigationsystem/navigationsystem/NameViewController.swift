//
//  NameViewController.swift
//  navigationsystem
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    var fullName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fullName = self.fullName {
            let firstLast = fullName.components(separatedBy: " ")
            firstNameTextField.text = firstLast[0]
            lastNameTextField.text = firstLast[1]
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
