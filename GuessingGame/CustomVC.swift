//
//  CustomVC.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/9/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class CustomVC: ViewController {
    
    @IBOutlet weak var maxNumberInRange: UITextField!
    
    @IBOutlet weak var checkRange: UIButton!
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBAction func checkRangeButtonTapped(_ sender: Any) {
        guard let userInput = UInt32(maxNumberInRange.text!) else{
            instructionLabel.text = "Please use a positive number"
            maxNumberInRange.text?.removeAll()
            return
        }
        randomNumberAndMax.randomNumber = Int.random(in: 0...Int(maxNumberInRange.text!)!)
        randomNumberAndMax.maxNumber = Int(maxNumberInRange.text!)!
    }
//    func shouldPerformSeguewithIdentifier (identifier: "CustomVCToGuessingScreen"!, sender: Any?) -> Bool {
//        guard let userInput = UInt32(maxNumberInRange.text!) else{
//            instructionLabel.text = "Please use a positive number"
//            maxNumberInRange.text?.removeAll()
//            return false
//        }
//        randomNumber = Int.random(in: 0...Int(maxNumberInRange.text!)!)
//        return true
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GuessingScreenVC
        {
            let vc = segue.destination as? GuessingScreenVC
            vc?.randomNumberAndMax = randomNumberAndMax
//            vc?.instructionLabel.text = "Please guess a number 1-\(randomNumber)"
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
