//
//  ViewController.swift
//  RetainCycles
//
//  Created by thusitha on 8/15/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class Service {
     var redController: RedViewController?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Red", style: .plain, target: self, action: #selector(handleShowRedController))
    }

    @objc func handleShowRedController() {
        navigationController?.pushViewController(RedViewController(), animated: true)
    }

}

//lets creat another view controller

class RedViewController: UITableViewController {
    //de inizilize corectly
    deinit {
        print("OS reclaiming memory for Red Controller")
    }
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        service.redController = self //after you did it it will not work
    }
}

