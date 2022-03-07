//
//  BaseCalorieCounter.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

protocol CalorieCounterProtocol {
    func calculateDailyCalorieBudget(
        ageInYears: Int,
        weightInKg: Float,
        heightInMeters: Float
    ) -> Float
}

class BaseCalorieCounter: CalorieCounterProtocol {

    enum Constants {
        static let pa: Float = 1.0
    }
    
    var term1: Float {
        0
    }
    
    var ageMultipier: Float {
        1
    }
    
    var weightMultipier: Float {
        1
    }
    
    var heightMultipier: Float {
        1
    }
    
    //private init() {}

// Based on logic:
// - For male: 662 - 9.53 x ageInYears + PA x (15.91 x weightInKg + 539.6 x heightInMeters)
// - For female: 354 - 6.91 x ageInYears + PA x (9.36 x weightInKg + 726 x heightInMeters)
    func calculateDailyCalorieBudget(
        ageInYears: Int,
        weightInKg: Float,
        heightInMeters: Float
    ) -> Float {
        term1
        - (ageMultipier * Float(ageInYears))
        + (Constants.pa
           * (
                (weightMultipier * weightInKg)
                + (heightMultipier * heightInMeters)
             )
          )
    }
}
