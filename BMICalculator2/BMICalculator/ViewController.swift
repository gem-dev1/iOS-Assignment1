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
        let height = Float(heightInput.text!)!
        let weight = Float(weightInput.text!)!
        
        // Validate inputs
        
        // Calculate BMI
        var bmiCalculator = BMICalculatorLogic(height: height, weight: weight, isSIMetric: isSIMetric)
        let bmi_result = bmiCalculator.calculateBMI()
        let formatted_bmi = String(format: "%.2f", bmi_result)
        let bmi_category = bmiCalculator.getCategory(bmi: bmi_result)
        
        // Update result
        //resultBMI.text = "\(height) and \(weight)"
        resultBMI.text = "Your BMI is \(formatted_bmi) - \(bmi_category)"
    }


    
}

		
