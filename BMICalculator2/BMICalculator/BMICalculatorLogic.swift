//
//  BMICalculatorLogic.swift
//  BMICalculator
//
//  Created by user239796 on 2/7/24.
//

import Foundation


class BMICalculatorLogic {
  var height : Float = 0
  var weight : Float = 0
  var isSIMetric : Bool = true

  init(height: Float, weight: Float, isSIMetric: Bool) {
    self.height = height
    self.weight = weight
    self.isSIMetric = isSIMetric
  }

  func calculateBMI() -> Float {
    var bmi = weight / pow(height, 2)
    if (!isSIMetric) {
      bmi = bmi * 703
    } else {
        bmi = weight / pow(height*0.01, 2)
    }
    return bmi
  }

  func getCategory(bmi: Float) -> String {
    
    switch bmi {
      case ...18.4:
        return "Underweight"
      case ...24.9:
        return "Normal"
      case ...29.9:
        return "Overweight"
      default:
        return "Obese"
    }
    
  }

}
