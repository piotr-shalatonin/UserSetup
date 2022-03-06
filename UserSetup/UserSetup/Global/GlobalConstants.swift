//
//  GlobalConstants.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

enum GlobalConstants {
    enum UI {
        static let genderSegue = "genderSegue"
        static let importSegue = "importSegue"
        static let weightSegue = "weightSegue"
        static let birthSegue = "birthSegue"
        static let calorieSegue = "calorieSegue"
        
        static let dateOfBirthFormat = "MMM d, yyyy"
    }
    
    enum User {
        static let defaultWeight: Float = 0
        static let defaultWeightUnit: WeightUnit = .pound
        
        static let minimumWeightKg: Float = 20
        static let minimumWeightPounds: Float = 40
        static let minimumAge: Int = 13
    }
}
