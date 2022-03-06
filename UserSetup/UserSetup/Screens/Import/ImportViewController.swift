//
//  ImportViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class ImportViewController: UIViewController {
    var viewModel: ImportViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "importScreen.title".localized
    }
    
    @IBAction func importButtonTapped(_ sender: Any) {
        openWeightScreen()
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        openWeightScreen()
    }
    
    private func openWeightScreen() {
        performSegue(withIdentifier: GlobalConstants.UI.weightSegue, sender: self)
    }
    
}
