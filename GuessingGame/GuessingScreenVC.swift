//
//  GuessingScreenVC.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/9/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class GuessingScreenVC: UIViewController {
    
    //Properties
    var viewController = ViewController()
    var guesses = 5
    var randomNumber : Int?
    
    //IB Outlets
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var guessingField: UITextField!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var highOrLow: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //IB Actions
    @IBAction func guessButtonTapped(_ sender: Any) {
        
        if let intGuess = Int(guessingField.text!) {
            if intGuess > randomNumber! { //Gives either a too high or too low to guide the user
                highOrLow.text = "Your Guess was Too High"
            } else if intGuess < randomNumber! {
                highOrLow.text = "Your Guess was Too Low"
            }
            guesses -= 1 //takes away a guess
            if Int(guessingField.text!) == randomNumber {
                highOrLow.text = "Congrats, you have won."
                guessesRemaining.text = "Would you like to play again?"
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else if guesses == 0 {
                guessesRemaining.text = "Would you like to play again?"
                highOrLow.text = "The correct answer was \(randomNumber!)"
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else {
                guessesRemaining.text = "\(guesses) guesses remaining"
            }
        } else {
            highOrLow.text = "Please use a number"
        }
    }
    
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let data = randomNumber {
            randomNumber = data
            print("random number: \(String(describing: randomNumber))")
        } else {
            print("error: \(String(describing: randomNumber))")
        }
        guesses = 5 //everytime the App is loaded the guesses go back to 5
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
