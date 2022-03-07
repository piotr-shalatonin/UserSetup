//
//  WelcomeViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 4.03.22.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    var viewModel = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }
    
    private func localize() {
        title = viewModel.title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch (identifier, segue.destination) {
            case (GlobalConstants.UI.genderSegue, let viewController as GenderViewController):
                viewController.viewModel = GenderViewModel()
            default:
                break
            }
        }
    }
}
