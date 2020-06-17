//
//  ViewController.swift
//  firstapp
//
//  Created by thusitha on 6/13/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numbersOfPairesOfCards: (cardButtons.count + 1) / 2) //if class will initilize if all variable are inilize in the class
    
    var flipCount: Int = 0 {//instance variable -- property
    //we can remove Int because Swift is strong type inference
        didSet { //property observer
            flipCountLbl.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLbl: UILabel!
    @IBOutlet var cardButtons: [UIButton]! // Array<UIButton>! Array is genaric class
    //COMAND KEY + variable for rename method or variable
    
    @IBAction func touchCard(_ sender: UIButton) { //_ under bar no argument
        flipCount += 1
        if let cardNumber = cardButtons.lastIndex(of: sender) {
//        print("cardNiumber = \(cardNumber)") //to see associated value
//            flipCard(withEmoj: emojiChoecies[cardNumber], on: sender)
        //if its nil it mean there is no associated value
            
            game.chooseCards(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card is not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if(card.isFaceUp) {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                button.setTitle(actor(for: card), for: .normal)
                button.setImage(UIImage(named: actor(for: card))?.withRenderingMode(.alwaysOriginal), for: .normal)
                button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                button.imageView?.contentMode = .scaleAspectFit
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setImage(nil, for: .normal)
            }
        }
    }
    
//    Data driven programming means that some general code exists. It does not contain any business logic, it does not control flow. It's just a tool to read and process data and output result. What controls flow and logic is data itself.
    
    func flipCard(withEmoj emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
//            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setImage(UIImage(named: emoji)?.withRenderingMode(.alwaysOriginal), for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            button.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    var emojiChoecies: Array<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
//    var characters = Dictionary<Int, String>()
    var characters = [Int:String]()
    
    func actor(for card: Card) -> String {
//        if characters[card.identifier] != nil {
//         return characters[card.identifier]!
//        } else {
//            return "?"
//        }
        
        if characters[card.identifier] == nil, emojiChoecies.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoecies.count)))
                characters[card.identifier] = emojiChoecies.remove(at: randomIndex)
        }
        
        return characters[card.identifier] ?? "?"
    }
}

