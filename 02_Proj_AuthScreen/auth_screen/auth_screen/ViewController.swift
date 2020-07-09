//
//  ViewController.swift
//  auth_screen
//
//  Created by Thusitha Jayalath on 7/9/20.
//  Copyright © 2020 Thusitha Jayalath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /**
          To Create Rounded Image, You can take refereance of image and make it rounded when its load
         */
        
        //        circularImage.layer.masksToBounds = true
        //        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
        
        setBackground()
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: "Day-Image")
        
        view.sendSubviewToBack(backgroundImageView)
    }
}

