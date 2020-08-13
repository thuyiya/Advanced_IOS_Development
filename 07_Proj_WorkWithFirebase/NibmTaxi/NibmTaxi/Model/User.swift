//
//  User.swift
//  NibmTaxi
//
//  Created by thusitha on 8/12/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import CoreLocation

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}
