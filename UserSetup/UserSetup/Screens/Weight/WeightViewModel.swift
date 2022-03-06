//
//  WeightViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class WeightViewModel: BaseViewModel {
    
    var helpLabelText: String {
        
        var weightUnit = GlobalConstants.User.defaultWeightUnit
        
        if let weightUnitUnwrapped = user.weightUnit {
            weightUnit = weightUnitUnwrapped
        }
        
        if weightUnit == .pound {
            return String(
                format: "weightScreen.weightHelpLabel".localized,
                "common.pounds".localized,
                String(198),
                String(220.5)
            )
        } else {
            return String(
                format: "weightScreen.weightHelpLabel".localized,
                "common.kg".localized,
                String(95),
                String(100.5)
            )
        }
    }
    
    func setWeight(weight: Float) {
        user.weight = weight
    }
    
    func validate() -> Bool {
        if let weight = user.weight,
            user.weightUnit == .pound,
            weight < GlobalConstants.User.minimumWeightPounds {
            return false
        }
        
        if let weight = user.weight,
            user.weightUnit == .kg,
            weight < GlobalConstants.User.minimumWeightKg {
            return false
        }
        
        return true
    }
}
