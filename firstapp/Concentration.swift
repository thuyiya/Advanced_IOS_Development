//
//  Concentration.swift
//  firstapp
//
//  Created by thusitha on 6/16/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation

class Concentration {
//    var cards = Array<Card>() //we can add parentheses to init - this will create empty array
    
    var cards = [Card]()
    
    func chooseCards(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numbersOfPairesOfCards: Int) {
        for _ in 1...numbersOfPairesOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
//            cards += [card, card]
            
            //TODO: Shuffle the card
        }
    }
}

