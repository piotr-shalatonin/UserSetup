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
        viewModel.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserData()
    }
    
    private func localize() {
        title = "weightScreen.title".localized
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        getUserData()
        
        if !viewModel.validate() {
            let message = "weightScreen.validationMessage".localized
            let weightParam = viewModel.user.weightUnit == .kg ? String(GlobalConstants.User.minimumWeightKg) : String(GlobalConstants.User.minimumWeightPounds)
            let weightUnitsParam = viewModel.user.weightUnit == .kg ? "common.kg".localized : "common.pounds".localized
            let formattedMessage = String(format: message, weightParam, weightUnitsParam)
            showAlert(
                title: "common.alert.title".localized,
                message: formattedMessage
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
        let weight = viewModel.user.weight ?? GlobalConstants.User.defaultWeight
        weightTextField.text = String(format: "%.1f", weight)
        
        let weightUnit = viewModel.user.weightUnit ?? GlobalConstants.User.defaultWeightUnit
        useMetricSwitch.isOn = weightUnit == .kg
        
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
