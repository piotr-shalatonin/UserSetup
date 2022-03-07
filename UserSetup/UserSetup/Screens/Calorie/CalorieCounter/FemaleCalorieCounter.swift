//
//  FemaleCalorieCounter.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

// Based on logic:
// - For female: 354 - 6.91 x ageInYears + PA x (9.36 x weightInKg + 726 x heightInMeters)
class FemaleCalorieCounter: BaseCalorieCounter {
    override var term1: Float {
        354
    }
    
    override var ageMultipier: Float {
        6.91
    }
    
    override  var weightMultipier: Float {
        9.36
    }
    
    override var heightMultipier: Float {
        726
    }
}
