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
        
        viewModel.loadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserData()
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
        title = "birthScreen.title".localized
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
        if let dateOfBirth = viewModel.user.dateOfBirth {
            datePicker.date = dateOfBirth
        }
        
        birthdayTextField.text = GlobalUtils.string(from: datePicker.date, format: GlobalConstants.UI.dateOfBirthFormat)
    }
    
    func getUserData() {
        viewModel.user.dateOfBirth = datePicker.date
    }
}
