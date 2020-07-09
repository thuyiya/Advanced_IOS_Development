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
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCards(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        //game play
        if !cards[index].isMatched { //there is 3 options
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no card or two card face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOfPairesOfCards: Int) {
        for _ in 1...numbersOfPairesOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
            
            //TODO: Shuffle the card
        }
    }
}

