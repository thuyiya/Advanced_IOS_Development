//
//  CountriesTableViewController.swift
//  fancytableView
//
//  Created by thusitha on 7/12/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    let countries = [
        Country(code: "lk", name: "Sri Lanka"),
        Country(code: "at", name: "Austria"),
        Country(code: "fr", name: "France"),
        Country(code: "de", name: "Germany")
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "CountryCell1", for: indexPath)
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "CountryCell2", for: indexPath)
        
        cell1.textLabel?.text = countries[indexPath.row].name
        cell1.detailTextLabel?.text = countries[indexPath.row].code
        
        cell2.textLabel?.text = countries[indexPath.row].name
        
        if(indexPath.row%2 == 0) {
                return cell1
        } else {
            return cell2
        }
    
    }

}
