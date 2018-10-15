//
//  ViewController.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/8/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variable
    var randomNumberAndMax : (randomNumber: Int? , maxNumber: Int?, guesses: Int?) = (262238663, 100, 5)

    //IB Action
    @IBAction func oneToOneHundredButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...100) //creates a random number
        randomNumberAndMax.maxNumber = 100 //and sets the max number and does this for all difficulties except custom
    }
    
    @IBAction func oneToFiveHundredButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...500)
        randomNumberAndMax.maxNumber = 500
        randomNumberAndMax.guesses = 7
    }
    
    @IBAction func oneToOneThousandButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...1000)
        randomNumberAndMax.maxNumber = 1000
        randomNumberAndMax.guesses = 10
    }
    
    
    //segue data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  //prepares the segue to transfer information
    {
        if segue.destination is GuessingScreenVC
        {
            let vc = segue.destination as? GuessingScreenVC
            vc?.randomNumberAndMax = randomNumberAndMax //sends over the tuple that carries the random number and the difficulty and the number of guesses
        }
    }
    
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

