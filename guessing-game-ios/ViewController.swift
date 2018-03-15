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
    @IBOutlet weak var button: UIButton!
    
    var randomNumber = Int(arc4random_uniform(100))
    var numberOfGuesses = 5
    
    var rulesLabelText = """
    *****************RULES*****************
    Rule 1. Guess a number between 0 and 100
    Rule 2. You have tries to guess the number
    Rule 3. You will be given hints

"""
    var buttonText = "Guess!"
    var zeroGuesses = "Try again!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        rulesLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        rulesLabel.text = rulesLabelText
        button.setTitle(buttonText, for: .normal)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func guessButtonPressed(_ sender: Any) {
        if button.title(for: .normal) == zeroGuesses {
            button.setTitle(buttonText, for: .normal)
        }
        if numberOfGuesses != 1 {
            numberOfGuesses -= 1
            let guess = Int(userGuessField.text!)!
            if guess > randomNumber {
                userFeedbackLabel.text = "Your guess was too high! You have \(numberOfGuesses) guesses left."
            } else if guess < randomNumber {
                userFeedbackLabel.text = "Your guess was too low! You have \(numberOfGuesses) guesses left."
            } else {
                userFeedbackLabel.text = "You guessed correcly!"
                button.setTitle(zeroGuesses, for: .normal)
            }
        } else {
            var noMoreGuesses = String(describing: button)
            userFeedbackLabel.text = "You have run out of guesses! The correct answer is \(randomNumber)"
            button.setTitle(zeroGuesses, for: .normal)
            randomNumber = Int(arc4random_uniform(100))
            numberOfGuesses = 5
            
            }
        }
    }


