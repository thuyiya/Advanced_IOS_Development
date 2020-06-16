//
//  ViewController.swift
//  firstapp
//
//  Created by thusitha on 6/13/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {//instance variable -- property
    //we can remove Int because Swift is strong type inference
        didSet { //property observer
            flipCountLbl.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLbl: UILabel!
    @IBOutlet var cardButtons: [UIButton]! // Array<UIButton>! Array is genaric class
    //COMAND KEY + variable for rename method or variable
    
    var emojiChoecies: Array<String> = ["😈", "😈", "😑", "😑"]
    
    @IBAction func touchCard(_ sender: UIButton) { //_ under bar no argument
        flipCount += 1
        if let cardNumber = cardButtons.lastIndex(of: sender) {
//        print("cardNiumber = \(cardNumber)") //to see associated value
            flipCard(withEmoj: emojiChoecies[cardNumber], on: sender)
        //if its nil it mean there is no associated value
        } else {
            print("chosen card is not in cardButtons")
        }
    }
    
//    Data driven programming means that some general code exists. It does not contain any business logic, it does not control flow. It's just a tool to read and process data and output result. What controls flow and logic is data itself.
    
    func flipCard(withEmoj emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

