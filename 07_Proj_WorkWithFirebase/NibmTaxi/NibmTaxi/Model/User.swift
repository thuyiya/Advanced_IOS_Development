//
//  User.swift
//  NibmTaxi
//
//  Created by thusitha on 8/12/20.
//  Copyright © 2020 nibm. All rights reserved.
//

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    
    init(dictionary: [String: Any]) {
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}
