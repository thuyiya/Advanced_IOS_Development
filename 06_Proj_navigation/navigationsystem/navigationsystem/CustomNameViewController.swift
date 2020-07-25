//
//  CustomNameViewController.swift
//  navigationsystem
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

protocol NameControllerDelegate: class {
    func nameController(nameVC: CustomNameViewController, didSaveName name: String)
}

class CustomNameViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!

    var fullName: String?
    weak var delegate: NameControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(CustomNameViewController.saveButtonTapped))
        self.navigationItem.title = "Edit Name"
        
        if let fullName = self.fullName {
            let firstLast = fullName.components(separatedBy: " ")
            firstNameTextField.text = firstLast[0]
            lastNameTextField.text = firstLast[1]
        }
    }

    @objc func saveButtonTapped() {
        let name = firstNameTextField.text! + " " + lastNameTextField.text!
        delegate?.nameController(nameVC: self, didSaveName: name)
        self.navigationController?.popViewController(animated: true)
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
