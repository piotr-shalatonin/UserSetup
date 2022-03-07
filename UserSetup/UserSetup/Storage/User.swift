//
//  User.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

enum Gender: Int {
    case male = 0
    case female = 1
}

enum WeightUnit : Int {
    case kg = 0
    case pound = 1
}

struct User {
    var gender: Gender?
    var weight: Float?
    var weightUnit: WeightUnit?
    var dateOfBirth: Date?
}

extension User {
    
    var ageInYears: Int {
        GlobalUtils.age(for: dateOfBirth ?? Date())
    }
    
    var weightInKg: Float {
        guard let weightUnit = weightUnit, let weight = weight else {
            return 0
        }
        
        switch weightUnit {
        case .kg:
            return weight
        case .pound:
            return GlobalUtils.convertPoundsToKg(pounds: weight)
        }
    }
    
    var heightInMeters: Float {
        GlobalConstants.User.averageHumanHeightInMeters
    }
}
