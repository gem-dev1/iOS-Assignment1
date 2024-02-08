//
//  ViewController.swift
//  BMICalculator
//
//  Created by user239796 on 2/2/24.
//

import UIKit

class ViewController: UIViewController {
    var isSIMetric = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    
    @IBOutlet weak var resultBMI: UILabel!
    
    @IBAction func onUnitChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            heightLabel.text = "Height in in"
            weightLabel.text = "Weight in lb"
            isSIMetric = false
        }
        else {
            heightLabel.text = "Height in cm"
            weightLabel.text = "Weight in kg"
            isSIMetric = true
        }
        
    }
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        // Fetch input from both labels
        let height = heightInput.text
        let weight = weightInput.text
        
        // Validate inputs
        let inputValidator = InputValidator(height: height, weight: weight)
        let validationMsg = inputValidator.validate()
        
        // Calculate BMI
        if validationMsg == "OK" {
            let actualHeight = Float(height!)!
            let actualWeight = Float(weight!)!
            
            var bmiCalculator = BMICalculatorLogic(height: actualHeight, weight: actualWeight, isSIMetric: isSIMetric)
            let bmi_result = bmiCalculator.calculateBMI()
            let formatted_bmi = String(format: "%.2f", bmi_result)
            let bmi_category = bmiCalculator.getCategory(bmi: bmi_result)
            
            // Update result
            //resultBMI.text = "\(height) and \(weight)"
            resultBMI.text = "Your BMI is \(formatted_bmi) - \(bmi_category)"
        }
        else {
            resultBMI.text = validationMsg
        }
    }


    
}

		
