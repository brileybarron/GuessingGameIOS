//
//  ViewController.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/8/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static var randomNumber : Int = 77
    @IBAction func oneToOneHundredButtonTapped(_ sender: Any) {
        ViewController.randomNumber = Int.random(in: 0...100)
    }
    
    @IBAction func oneToFiveHundredButtonTapped(_ sender: Any) {
        ViewController.randomNumber = Int.random(in: 0...500)
    }
    
    @IBAction func oneToOneThousandButtonTapped(_ sender: Any) {
        ViewController.randomNumber = Int.random(in: 0...1000)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

