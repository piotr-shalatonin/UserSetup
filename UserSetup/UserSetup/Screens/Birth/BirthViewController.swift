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
        
        setupControls()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadData()
        setUserData()
        birthdayTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        birthdayTextField.resignFirstResponder()
    }
    
    private func setupControls() {
        birthdayTextField.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
    }
    
    @objc func handleDatePicker(_ datePicker: UIDatePicker) {
        getUserData()
        setUserData()
    }
    
    private func localize() {
        title = viewModel.title
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        getUserData()
        
        if !viewModel.validate() {
            showAlert(
                title: "common.alert.title".localized,
                message: "birthScreen.validationMessage".localized
            )
            return
        }
        viewModel.saveData()

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
    
    func setUserData() {
        datePicker.date = viewModel.datePickerDate
        birthdayTextField.text = viewModel.birthdayTextFieldText
    }
    
    func getUserData() {
        viewModel.user.dateOfBirth = datePicker.date
    }
}
