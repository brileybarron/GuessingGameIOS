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
    var randomNumber : Int = 262238663
    
    //IB Action
    @IBAction func oneToOneHundredButtonTapped(_ sender: Any) {
        randomNumber = Int.random(in: 0...100)
    }
    
    @IBAction func oneToFiveHundredButtonTapped(_ sender: Any) {
        randomNumber = Int.random(in: 0...500)
    }
    
    @IBAction func oneToOneThousandButtonTapped(_ sender: Any) {
        randomNumber = Int.random(in: 0...1000)
    }
    
    
    //segue data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GuessingScreenVC
        {
            let vc = segue.destination as? GuessingScreenVC
            vc?.randomNumber = randomNumber
            
        }
    }
    
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

