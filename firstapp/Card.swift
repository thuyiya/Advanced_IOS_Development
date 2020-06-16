//
//  Card.swift
//  firstapp
//
//  Created by thusitha on 6/16/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation

struct Card { //no inheritance, value type
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}
