//
//  ViewController.swift
//  navigationsystem
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource  {
    
    var names = ["Brent Berg", "Cody Preston", "Kareem Dixon", "Xander Clark",
    "Francis Frederick", "Carson Hopkins", "Anthony Nguyen", "Dean Franklin",
    "Jeremy Davenport", "Rigel Bradford", "John Ball", "Zachery Norman",
    "Valentine Lindsey", "Slade Thornton", "Jelani Dickson", "Vance Hurley",
    "Wayne Ellison", "Kasimir Mueller", "Emery Pruitt", "Lucius Lawrence",
    "Kenneth Mendez"]
    @IBOutlet weak var tblViewUsers: UITableView!
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNameControllerSegue" {
            let cell = sender as! UITableViewCell
            if let indexPath = tblViewUsers.indexPath(for: cell) {
                let nameController = segue.destination as! NameViewController
                nameController.fullName = names[indexPath.row]
                tblViewUsers.deselectRow(at: indexPath, animated: true)
                selectedIndexPath = indexPath
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    @IBAction func saveName(segue: UIStoryboardSegue) {
        let nameController = segue.source as! NameViewController
        let name = nameController.firstNameTextField.text! + " " + nameController.lastNameTextField.text!

        if let indexPath = selectedIndexPath {
            names[indexPath.row] = name
            tblViewUsers.reloadRows(at: [indexPath], with: .automatic)
            selectedIndexPath = nil
        }
    }

}

