//
//  StatsViewController.swift
//  GuessingGame
//
//  Created by Briley Barron on 10/16/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var winsAndLosses: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var winPercent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        winsAndLosses.text = "\(defaults.integer(forKey: "wins") + defaults.integer(forKey:"losses"))"
        
        wins.text = "\(defaults.integer(forKey: "wins"))"
        
        losses.text = "\(defaults.integer(forKey: "losses"))"
        
        if defaults.integer(forKey: "wins") + defaults.integer(forKey:"losses") != 0 {
            winPercent.text = "\(defaults.integer(forKey: "wins") / defaults.integer(forKey: "wins") + defaults.integer(forKey:"losses"))%"
        } else {
            winPercent.text = "0%"
        }
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
