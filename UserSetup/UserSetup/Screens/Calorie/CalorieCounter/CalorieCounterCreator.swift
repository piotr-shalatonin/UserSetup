//
//  CalorieCounterCreator.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

class CalorieCounterCreator {
    static func createCalorieCounter(by gender: Gender) -> CalorieCounterProtocol {
        switch gender {
        case .male:
            return MaleCalorieCounter()
        case .female:
            return FemaleCalorieCounter()
        }
    }
}
