//
//  EXAuthViewController.swift
//  auth_screen
//
//  Created by thusitha on 7/12/20.
//  Copyright © 2020 Thusitha Jayalath. All rights reserved.
//

import UIKit

extension AuthViewController {
    
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
