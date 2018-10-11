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
    var randomNumberAndMax : (randomNumber: Int? , maxNumber: Int?) = (262238663, 100)

    //IB Action
    @IBAction func oneToOneHundredButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...100)
        randomNumberAndMax.maxNumber = 100
    }
    
    @IBAction func oneToFiveHundredButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...500)
        randomNumberAndMax.maxNumber = 500
    }
    
    @IBAction func oneToOneThousandButtonTapped(_ sender: Any) {
        randomNumberAndMax.randomNumber = Int.random(in: 0...1000)
        randomNumberAndMax.maxNumber = 1000
    }
    
    
    //segue data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GuessingScreenVC
        {
            let vc = segue.destination as? GuessingScreenVC
            vc?.randomNumberAndMax = randomNumberAndMax
        }
    }
    
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

