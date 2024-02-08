//
//  InputValidator.swift
//  BMICalculator
//
//  Created by user239796 on 2/7/24.
//

import Foundation

class InputValidator {
    var height : String? = ""
    var weight : String? = ""
    
    init(height: String?, weight: String?) {
        self.height = height
        self.weight = weight        
    }
    
    func validate() -> String{
        if let actualHeightString = height {
            let heightFloat : Float? = Float(actualHeightString)
            if let actualHeightFloat = heightFloat {
                if actualHeightFloat <= 0 {
                    return "Height needs to be greater than 0"
                }
            }
            else {
                return "Height needs to be a valid measure"
            }
        }
        else {
            return "Height cannot be empty"
        }
        
        if let actualWeightString = weight {
            let weightFloat : Float? = Float(actualWeightString)
            if let actualWeightFloat = weightFloat {
                if actualWeightFloat <= 0 {
                    return "Weight needs to be greater than 0"
                }
            }
            else {
                return "Weight needs to be a valid measure"
            }
        }
        else {
            return "Weight cannot be empty"
        }
        return "OK"
    }
}
