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
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var useMetricSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }
    
    private func localize() {
        title = "weightScreen.title".localized
        helpLabel.text = viewModel.helpLabelText
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        openBirthScreen()
    }
    
    private func openBirthScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.birthSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch (identifier, segue.destination) {
            case (GlobalConstants.UI.birthSegue, let viewController as BirthViewController):
                viewController.viewModel = BirthViewModel()
            default:
                break
            }
        }
    }
    
}
