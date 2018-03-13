//
//  ViewController.swift
//  guessing-game-ios
//
//  Created by Kenny Tran on 3/12/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessField: UITextField!
    @IBOutlet weak var userFeedbackLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    
    var randomNumber = Int(arc4random_uniform(100))
    var numberOfGuesses = 5
    var rulesLabelText = """
    *****************RULES*****************
    Rule 1. Guess a number between 0 and 100
    Rule 2. You have tries to guess the number
    Rule 3. You will be given hints

"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        rulesLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        rulesLabel.text = rulesLabelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func guessButtonPressed(_ sender: Any) {
        let guesses = Int(userGuessField!)!
        if guesses > randomNumber {
            numberOfGuesses -= 1
            userFeedbackLabel.text = "Your guess was too low! You have \(numberOfGuesses) left."
        } else if guesses < randomNumber {
            numberOfGuesses -= 1
            userFeedbackLabel.text = "Your guess was too high! You have \(numberOfGuesses) left."
        } else {
            userFeedbackLabel.text = "You guessed correcly!"
        }
            if numberOfGuesses == 0 {
                userFeedbackLabel.text = "You have run out of guesses!"
            }
    }
}


