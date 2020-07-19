//
//  MyCityTableViewController.swift
//  airbnb
//
//  Created by thusitha on 7/19/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

struct City {
    var name: String
    var isoCode: String
}

class MyCityTableViewController: UITableViewController {
    var cityList = [
        City(name: "Colombo", isoCode: "at"),
        City(name: "Kandy", isoCode: "at"),
        City(name: "Matara", isoCode: "at"),
        City(name: "Kaluthara", isoCode: "at"),
        City(name: "Kgalle", isoCode: "at"),
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  cityList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCellX", for: indexPath) as! CityTableViewCell
        cell.cityNameLbl.text = cityList[indexPath.row].name
        cell.codeNameLbl.text = cityList[indexPath.row].isoCode
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
