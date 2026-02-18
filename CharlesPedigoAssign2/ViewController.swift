//
//  ViewController.swift
//  CharlesPedigoAssign2
//
//  Created by Pedigo, Charles L. on 2/17/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var caloriesStackView: UIStackView!
    @IBOutlet weak var stepsStackView: UIStackView!
    @IBOutlet weak var mealPlannerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Round out main menu edges
        caloriesStackView.layer.cornerRadius = 12 //Round out edges
        stepsStackView.layer.cornerRadius = 12 //Round out edges
        mealPlannerButton.layer.cornerRadius = 12
        
        
        
        
    }


}

