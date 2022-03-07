//
//  GlobalUtils.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

struct GlobalUtils {
    
    static func string(from date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    
    static func age(for dateOfBirth: Date, using currentDate: Date = Date()) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: currentDate)
        return ageComponents.year ?? 0
    }
    
    static func convertPoundsToKg(pounds: Float) -> Float {
        let weight = Measurement(value: Double(pounds), unit: UnitMass.pounds)
        let weightConverted = weight.converted(to: UnitMass.kilograms)
        return Float(weightConverted.value)
    }
}
