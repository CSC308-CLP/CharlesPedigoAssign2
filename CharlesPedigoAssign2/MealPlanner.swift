//
//  MealPlanner.swift
//  CharlesPedigoAssign2
//
//  Created by Pedigo, Charles L. on 2/18/26.
//

import UIKit

class MealPlanner: UIViewController {

    //Meal Planner Scene Outlets
    @IBOutlet weak var calorieMealsTextField: UITextField!
    @IBOutlet weak var calorieSnacksTextField: UITextField!
    @IBOutlet weak var activityStepsTextField: UITextField!
    @IBOutlet weak var activityMinutesTextField: UITextField!
    
    //Meal Planner Output Outlets
    @IBOutlet weak var simulateTodayOutput: UILabel!
    @IBOutlet weak var todaySummaryOutput: UILabel!
    @IBOutlet weak var stepsRemainingOutput: UILabel!
    
    //Simulate Day Button Outlets
    @IBOutlet weak var simulateDayButton: UIButton!
    @IBAction func simulateDay(_ sender: UIButton) {
        //Variable Constants
        let baselineBurn = 1800
        let burnPerStep = 0.05
        let burnPerMinute = 8.0
        
        //Input based variables:
        var totalBurn: Double = 0
        var totalIntake: Double = 0
        
        //Check and calculate burn variables
        if let steps = Double(activityStepsTextField.text ?? "0") {
            if let minutes = Double(activityMinutesTextField.text ?? "0") {
                totalBurn = 1800 + steps * burnPerStep + minutes * burnPerMinute
            }else{
                print("Type conversion failed for minutes")
                totalBurn = 0
            }
        }else{
            print("Type conversion failed for steps")
            totalBurn = 0
        }
        
        //Check and calculate intake variables
        if let mealIntake = Double(calorieMealsTextField.text ?? "0") {
            if let snackIntake = Double(calorieSnacksTextField.text ?? "0") {
                totalIntake = mealIntake + snackIntake
            }else{
                print("Type conversion failed for snacks")
                let snackIntake = 0.0
                totalIntake = mealIntake + snackIntake
            }
        }else{
            print("Type conversion failed for meals")
            let mealIntake = 0.0
            if let snackIntake = Double(calorieSnacksTextField.text ?? "0") {
                totalIntake = mealIntake + snackIntake
            }else{
                print("Type conversion failed for snacks")
                let snackIntake = 0.0
                totalIntake = mealIntake + snackIntake
            }
        }
        
        //Calculate and determine outputs
        let diffKcal = totalIntake - totalBurn
        let poundsChange = round(100*(abs(diffKcal)/3500))/100
        if diffKcal > 0 { //Determines output for simulating the day of eating vs activity
            simulateTodayOutput.text = "Eating is more than activity"
            todaySummaryOutput.text = "You have gained \(poundsChange) pounds today."
            //Since there is more intake, calculate extra steps
            var kCalRemaining = diffKcal
            var extraSteps: Int = 0
            while kCalRemaining > 0 { //Loop to convert remaining kcal into steps
                kCalRemaining = kCalRemaining - burnPerStep
                extraSteps += 1
            }
            var extraMile = round(100*(Double(extraSteps)/2000))/100 //Calculate miles
            stepsRemainingOutput.text = "Extra steps to balance: \(extraSteps) (~ \(extraMile) miles)"
            
        }else if diffKcal < 0 {
            simulateTodayOutput.text = "Eating is less than activity"
            todaySummaryOutput.text = "You have lost \(poundsChange) pounds today."
            stepsRemainingOutput.text = "Extra steps to balance: 0 (~0.0 miles)"
        }else{
            simulateTodayOutput.text = "Eating is equal to activity"
            todaySummaryOutput.text = "You have not gained or lost any pounds today."
            stepsRemainingOutput.text = "Extra steps to balance: 0 (~0.0 miles)"
        }
        
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Round out edges
        simulateDayButton.layer.cornerRadius = 12
        
    }


}


