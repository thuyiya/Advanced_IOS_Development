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
        let radius = self.frame.width/2.0
        layer.cornerRadius = radius
        self.clipsToBounds = true
//        self.image?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5,
//        right: 25))
    }

}
