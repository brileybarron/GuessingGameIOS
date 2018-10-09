//
//  ViewController.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/8/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func chooseANumberZeroToOneHundredButtonTapped(_ sender: Any) {
        let randomNumber = Int.random(in: 0...100)
        print("""
You will have five guesses to figure out what the random number is.  There will be a hint after each guess that should lead you closer to the answer.  Good Luck!!


Please choose a number from 0-100
""")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

