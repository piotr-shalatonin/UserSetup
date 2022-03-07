//
//  WeightViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class WeightViewModel: BaseViewModel {
    
    var title: String {
        "weightScreen.title".localized
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
    
    var validationAlertTitle: String {
        "common.alert.title".localized
    }
    
    var validationAlertMessage: String {
        let message = "weightScreen.validationMessage".localized
        let weightParam = user.weightUnit == .kg ? String(GlobalConstants.User.minimumWeightKg) : String(GlobalConstants.User.minimumWeightPounds)
        let weightUnitsParam = user.weightUnit == .kg ? "common.kg".localized : "common.pounds".localized
        return String(format: message, weightParam, weightUnitsParam)
    }
    
    var weightTextFieldText: String {
        let weight = user.weight ?? GlobalConstants.User.defaultWeight
        return String(format: "%.1f", weight)
    }
    
    var useMetricsSwitchOn: Bool {
        let weightUnit = user.weightUnit ?? GlobalConstants.User.defaultWeightUnit
        return weightUnit == .kg
    }
    
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
}
