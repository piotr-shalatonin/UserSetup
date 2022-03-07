//
//  MaleCalorieCounter.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

// Based on logic:
// For male: 662 - 9.53 x ageInYears + PA x (15.91 x weightInKg + 539.6 x heightInMeters)
class MaleCalorieCounter: BaseCalorieCounter {
    override var term1: Float {
        662
    }
    
    override var ageMultipier: Float {
        9.53
    }
    
    override  var weightMultipier: Float {
        15.91
    }
    
    override var heightMultipier: Float {
        539.6
    }
}
