//
//  ASExtentions.swift
//  auth_screen
//
//  Created by Thusitha Jayalath on 7/9/20.
//  Copyright © 2020 Thusitha Jayalath. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
