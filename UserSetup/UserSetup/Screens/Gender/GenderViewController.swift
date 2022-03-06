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
        self.title = "genderScreen.title".localized
    }
    
    @IBAction func maleButtonTapped(_ sender: Any) {
        openImportScreen()
    }
    
    @IBAction func femaleButtonTapped(_ sender: Any) {
        openImportScreen()
    }
    
    private func openImportScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.importSegue, sender: self)
    }
}
