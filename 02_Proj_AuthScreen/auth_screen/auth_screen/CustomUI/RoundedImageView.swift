//
//  RoundedImageView.swift
//  auth_screen
//
//  Created by Thusitha Jayalath on 7/9/20.
//  Copyright © 2020 Thusitha Jayalath. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundedImage()
    }
}
