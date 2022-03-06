//
//  WeightViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class WeightViewController: UIViewController {
    var viewModel: WeightViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "weightScreen.title".localized
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        openBirthScreen()
    }
    
    private func openBirthScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.birthSegue, sender: self)
    }
    
}
