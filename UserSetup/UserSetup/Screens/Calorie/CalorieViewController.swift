//
//  CalorieViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class CalorieViewController: UIViewController {
    var viewModel: CalorieViewModel!
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadData()
        setUserData()
    }
    
    func setUserData() {
        let gender = viewModel.user.gender ?? .male
        let calorieCounter = CalorieCounterCreator.createCalorieCounter(by: gender)
        
        let dailyCalorieBudget = calorieCounter.calculateDailyCalorieBudget(
            ageInYears: viewModel.user.ageInYears,
            weightInKg: viewModel.user.weightInKg,
            heightInMeters: viewModel.user.heightInMeters
        )
        budgetLabel.text = String(dailyCalorieBudget)
    }
    
    private func localize() {
        title = "calorieScreen.title".localized
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
    }
}
