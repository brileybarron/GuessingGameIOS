//
//  GuessingScreenVC.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/9/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class GuessingScreenVC: UIViewController {
    var viewController = ViewController()
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var guessingField: UITextField!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var highOrLow: UILabel!
    var guesses = 5
    @IBAction func guessButtonTapped(_ sender: Any) {
        if let intGuess = Int(guessingField.text!) {
            if intGuess > ViewController.randomNumber {
                highOrLow.text = "Too High"
            } else if intGuess < ViewController.randomNumber {
                highOrLow.text = "Too Low"
            }
            guesses -= 1
            guessesRemaining.text = "\(guesses) guesses remaining"
        } else {
            highOrLow.text = "Please use a number"
        }
    }
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
