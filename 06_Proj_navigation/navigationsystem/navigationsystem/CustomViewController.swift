//
//  CustomViewController.swift
//  navigationsystem
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NameControllerDelegate {
    
    var names = ["Brent Berg", "Cody Preston", "Kareem Dixon", "Xander Clark",
                 "Francis Frederick", "Carson Hopkins", "Anthony Nguyen", "Dean Franklin",
                 "Jeremy Davenport", "Rigel Bradford", "John Ball", "Zachery Norman",
                 "Valentine Lindsey", "Slade Thornton", "Jelani Dickson", "Vance Hurley",
                 "Wayne Ellison", "Kasimir Mueller", "Emery Pruitt", "Lucius Lawrence",
                 "Kenneth Mendez"]
    
    var tableView: UITableView!
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameVC = CustomNameViewController()
        nameVC.fullName = names[indexPath.row]
        nameVC.delegate = self
        
        selectedIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(nameVC, animated: true)
    }
    
    func nameController(nameVC: CustomNameViewController, didSaveName name: String) {
        if let indexPath = selectedIndexPath {
            names[indexPath.row] = name
            tableView.reloadRows(at: [indexPath], with: .automatic)
            selectedIndexPath = nil
        }
    }
}
