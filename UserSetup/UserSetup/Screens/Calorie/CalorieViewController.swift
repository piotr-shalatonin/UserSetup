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
        budgetLabel.text = viewModel.budgetLabelText
    }
    
    private func localize() {
        title = "calorieScreen.title".localized
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
    }
}
