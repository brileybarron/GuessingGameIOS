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
    var guesses = 5
    var randomNumberAndMax : (randomNumber: Int?, maxNumber: Int?, guesses: Int?)
    var probability : Double = 0
    var avaliableRange = [Int]()
    var guessesUsed = [String]()
//    var overallPercentProbability: Double = 0
    //IB Outlets
//    @IBOutlet weak var overallProbability: UILabel!
//    @IBOutlet weak var listOfGuesses: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var probabilityLabel: UILabel!
    @IBOutlet weak var guessingField: UITextField!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var highOrLow: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //IB Actions
    @IBAction func guessButtonTapped(_ sender: Any) {
        if let intGuess = Int(guessingField.text!) { //checks to see if the text box can be an integer

            //If it is
            if intGuess > randomNumberAndMax.randomNumber! { //Gives either a too high or too low to guide the user
                //updates the labels
                highOrLow.text = "Your Guess was Too High"
                //updates the array for probability
                eliminateNumbers(userInput: intGuess, high: true)
                //converts the user guess to a string to allow for easier updating of a string array

                //then updates the probability
                updateProbability()
            } else if intGuess < randomNumberAndMax.randomNumber! { //same thing is done below
                highOrLow.text = "Your Guess was Too low"
                eliminateNumbers(userInput: intGuess, high: false)
                updateProbability()
            }
            
            randomNumberAndMax.guesses! -= 1 //takes away a guess
            
            if Int(guessingField.text!) == randomNumberAndMax.randomNumber { //checks to see if the guess is the random number and tells them they won
                highOrLow.text = "Congrats, you have won."
                guessesRemaining.text = "Would you like to play again?"
                //hides the button for guessing and unhides the button that takes them back to the starting screen
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else if randomNumberAndMax.guesses! == 0 { //checks to see if the guesses are at 0 if they are then it tells the user that they are out of guesses and asks if they would like to play again
                guessesRemaining.text = "Would you like to play again?"
                highOrLow.text = "The correct answer was \(randomNumberAndMax.randomNumber!)"
                //hides the button for guessing and unhides the button that takes them back to the starting screen
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else { //if there are still guesses remaining then it allows the user to continue with the game
                guessesRemaining.text = "\(randomNumberAndMax.guesses!) guesses remaining"
            }
            
        } else {
            //if not then
            highOrLow.text = "Please use a number"
        
        }
        //removes al the text from the text field
        guessingField.text?.removeAll()
    }
    
    func win() {
        
        let defaults = UserDefaults.standard
        
        let wins = defaults.integer(forKey: "wins")
        
        defaults.set(wins + 1, forKey: "wins")
        
        highOrLow.text = "Congrats, you have won."
        guessesRemaining.text = "Would you like to play again?"
        //hides the button for guessing and unhides the button that takes them back to the starting screen
        playAgainButton.isHidden = false
        guessButton.isHidden = true
    }
    
    func lose() {
        let defaults = UserDefaults.standard
        
        let loses = defaults.integer(forKey: "loses")
        
        defaults.set(loses + 1, forKey: "loses")
        
        guessesRemaining.text = "Would you like to play again?"
        highOrLow.text = "The correct answer was \(randomNumberAndMax.randomNumber!)"
        //hides the button for guessing and unhides the button that takes them back to the starting screen
        playAgainButton.isHidden = false
        guessButton.isHidden = true
    }
    
    func eliminateNumbers (userInput: Int, high: Bool){//this will update the array of numbers used to find the probability
        if high == true { //if the guess was too high then it removes anything higher than the user's guess
            for number in avaliableRange {
                if number >= userInput{
                    avaliableRange.remove(at: avaliableRange.firstIndex(of: number)!)
                }
            }
        } else { // and if the guess is too low then it removes anything below the user's guess
            for number in avaliableRange {
                if number <= userInput{
                    avaliableRange.remove(at: avaliableRange.firstIndex(of: number)!)
                }
            }
        }
    }
    

    func updateProbability () { //recalculates the probability and updates the probability label

        probability = 1 / Double(avaliableRange.count) * 100
        probabilityLabel.text = "Probability: \(round(probability * 1000)/1000)%"
    }
    

    //LifeCycle
    override func viewDidLoad() { //when loading the view the program checks to see if all the data is correct
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let data = randomNumberAndMax.randomNumber { //integer validation
            randomNumberAndMax.randomNumber = data
            print("random number: \(String(describing: randomNumberAndMax.randomNumber))")
        } else {
            print("error: \(String(describing: randomNumberAndMax.randomNumber))")//gives an error message if something goes wrong
        }
        
        if let data = randomNumberAndMax.maxNumber {//integer validation
            randomNumberAndMax.maxNumber = data
            print("random number: \(String(describing: randomNumberAndMax.maxNumber))")
        } else {
            print("error: \(String(describing: randomNumberAndMax.maxNumber))")//gives an error message if something goes wrong
        }
        avaliableRange = Array(0...randomNumberAndMax.maxNumber!) //updates the range
        updateProbability() //and the probability
        
        guessesRemaining.text = "\(randomNumberAndMax.guesses!) guesses remaining"
        
        //adds a gesture that allows the keyboard to be lowered if tapped outside of the keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
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
