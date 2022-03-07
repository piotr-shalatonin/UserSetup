//
//  CalorieViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class CalorieViewModel: BaseViewModel {
    var budgetLabelText: String {
        let gender = user.gender ?? .male
        let calorieCounter = CalorieCounterCreator.createCalorieCounter(by: gender)
        
        let dailyCalorieBudget = calorieCounter.calculateDailyCalorieBudget(
            ageInYears: user.ageInYears,
            weightInKg: user.weightInKg,
            heightInMeters: user.heightInMeters
        )
        return String(dailyCalorieBudget)
    }
}
