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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadData()
        setUserData()
        
        weightTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        weightTextField.resignFirstResponder()
    }
    
    private func localize() {
        title = viewModel.title
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        getUserData()
        
        if !viewModel.validate() {
            showAlert(
                title: viewModel.validationAlertTitle,
                message: viewModel.validationAlertMessage
            )
            return
        }
        viewModel.saveData()
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
    
    func setUserData() {
        weightTextField.text = viewModel.weightTextFieldText
        useMetricSwitch.isOn = viewModel.useMetricsSwitchOn
        helpLabel.text = viewModel.helpLabelText
    }
    
    func getUserData() {
        if let weightString = weightTextField.text {
            viewModel.user.weight = Float(weightString)
        } else {
            viewModel.user.weight = GlobalConstants.User.defaultWeight
        }
        viewModel.user.weightUnit = useMetricSwitch.isOn ? .kg : .pound
    }
    
    @IBAction func useMetricSwitchTapped(_ sender: Any) {
        getUserData()
        setUserData()
    }
}
