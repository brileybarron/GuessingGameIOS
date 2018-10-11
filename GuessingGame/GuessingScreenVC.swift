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
    var randomNumberAndMax : (randomNumber: Int?, maxNumber: Int?)
    var probability : Double = 0
    var avaliableRange = [Int]()
    var guessesUsed = [String]()
    
    //IB Outlets
    @IBOutlet weak var listOfGuesses: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var probabilityLabel: UILabel!
    @IBOutlet weak var guessingField: UITextField!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var highOrLow: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //IB Actions
    @IBAction func guessButtonTapped(_ sender: Any) {
        
        if let intGuess = Int(guessingField.text!) {
            
            if intGuess > randomNumberAndMax.randomNumber! { //Gives either a too high or too low to guide the user
                highOrLow.text = "Your Guess was Too High"
                eliminateNumbers(userInput: intGuess, high: true)
                updateProbability()
            } else if intGuess < randomNumberAndMax.randomNumber! {
                highOrLow.text = "Your Guess was Too Low"
                eliminateNumbers(userInput: intGuess, high: false)
                updateProbability()
            }
            
            guesses -= 1 //takes away a guess
            
            if Int(guessingField.text!) == randomNumberAndMax.randomNumber {
                highOrLow.text = "Congrats, you have won."
                guessesRemaining.text = "Would you like to play again?"
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else if guesses == 0 {
                guessesRemaining.text = "Would you like to play again?"
                highOrLow.text = "The correct answer was \(randomNumberAndMax.randomNumber!)"
                playAgainButton.isHidden = false
                guessButton.isHidden = true
            } else {
                guessesRemaining.text = "\(guesses) guesses remaining"
            }
            
        } else {
            
            highOrLow.text = "Please use a number"
        
        }
    }
    
    func eliminateNumbers (userInput: Int, high: Bool){
        if high == true {
            for number in avaliableRange {
                if number >= userInput{
                    avaliableRange.remove(at: avaliableRange.firstIndex(of: number)!)
                }
            }
        } else {
            for number in avaliableRange {
                if number <= userInput{
                    avaliableRange.remove(at: avaliableRange.firstIndex(of: number)!)
                }
            }
        }
    }
    
    func updateProbability () {
        probability = 1 / Double(avaliableRange.count) * 100
        probabilityLabel.text = "Probability: \(probability)%"
    }
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let data = randomNumberAndMax.randomNumber {
            randomNumberAndMax.randomNumber = data
            print("random number: \(String(describing: randomNumberAndMax.randomNumber))")
        } else {
            print("error: \(String(describing: randomNumberAndMax.randomNumber))")
        }
        
        if let data = randomNumberAndMax.maxNumber {
            randomNumberAndMax.maxNumber = data
            print("random number: \(String(describing: randomNumberAndMax.maxNumber))")
        } else {
            print("error: \(String(describing: randomNumberAndMax.maxNumber))")
        }
        guesses = 5 //everytime the App is loaded the guesses go back to 5
        avaliableRange = Array(0...randomNumberAndMax.maxNumber!)
        updateProbability()
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
