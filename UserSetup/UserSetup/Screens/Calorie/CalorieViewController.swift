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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "calorieScreen.title".localized
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
    }
}
