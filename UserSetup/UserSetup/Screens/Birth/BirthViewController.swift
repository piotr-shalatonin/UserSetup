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
    
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localize()
        
        birthdayTextField.inputView = datePicker
    }
    
    private func localize() {
        title = "birthScreen.title".localized
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        openCalorieScreen()
    }
    
    private func openCalorieScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.calorieSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch (identifier, segue.destination) {
            case (GlobalConstants.UI.calorieSegue, let viewController as CalorieViewController):
                viewController.viewModel = CalorieViewModel()
            default:
                break
            }
        }
    }
}
