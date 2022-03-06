//
//  GenderViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class GenderViewController: UIViewController {
    var viewModel: GenderViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }
    
    private func localize() {
        title = "genderScreen.title".localized
    }
    
    @IBAction func maleButtonTapped(_ sender: Any) {
        genderButtonTapped(for: .male)
    }
    
    @IBAction func femaleButtonTapped(_ sender: Any) {
        genderButtonTapped(for: .female)
    }
    
    func genderButtonTapped(for gender: Gender) {
        viewModel.setGender(gender: gender)
        viewModel.saveData()
        openImportScreen()
    }
    
    private func openImportScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.importSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch (identifier, segue.destination) {
            case (GlobalConstants.UI.importSegue, let viewController as ImportViewController):
                viewController.viewModel = ImportViewModel()
            default:
                break
            }
        }
    }
}
