//
//  BirthViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class BirthViewController: UIViewController {
    var viewModel: BirthViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "birthScreen.title".localized
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        openCalorieScreen()
    }
    
    private func openCalorieScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.calorieSegue, sender: self)
    }
}
