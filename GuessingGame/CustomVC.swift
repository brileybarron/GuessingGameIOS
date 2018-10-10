//
//  CustomVC.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/9/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class CustomVC: ViewController {
    static var customRange = [Int]()
    
    @IBOutlet weak var maxNumberInRange: UITextField!
    
    @IBOutlet weak var checkRange: UIButton!
    @IBOutlet weak var customRangeDoneButton: UIButton!
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBAction func checkRangeButtonTapped(_ sender: Any) {
        guard let userInput = Int(maxNumberInRange.text!) else{
            instructionLabel.text = "Please use a number"
            maxNumberInRange.text?.removeAll()
            return
        }
        CustomVC.customRange = Array(0...userInput)
        customRangeDoneButton.isHidden = false
        checkRange.isHidden = true
//        if let userInput = Int(maxNumberInRange.text!){
//            CustomVC.customRange = Array(0...userInput)
//            customRangeDoneButton.isHidden = false
//            checkRange.isHidden = true
//        } else {
//            instructionLabel.text = "Please use a number"
//        }
    }
    
    @IBAction func customRangeDoneButtonTapped(_ sender: Any) {
        
        if CustomVC.customRange.randomElement() != nil {
            ViewController.randomNumber = CustomVC.customRange.randomElement()!
        } else {
            
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
