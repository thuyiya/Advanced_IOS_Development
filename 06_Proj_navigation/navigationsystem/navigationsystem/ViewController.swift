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
        
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#95a5a6")
        
        if let navigationBar = navigationController?.navigationBar {
            
            navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)

            let shadow = NSShadow()
            shadow.shadowColor = UIColor.gray.withAlphaComponent(0.5)
            shadow.shadowOffset = CGSize(width: 2, height: 2)
            shadow.shadowBlurRadius = 4
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                NSAttributedString.Key.foregroundColor : UIColor(red: 0.5, green: 0.15, blue: 0.15, alpha: 0.8),
                NSAttributedString.Key.shadow : shadow
            ]
        }
        
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
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

