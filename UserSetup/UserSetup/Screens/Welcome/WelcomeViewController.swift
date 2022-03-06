//
//  WelcomeViewController.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 4.03.22.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    var viewModel: WelcomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        
    }
    
    private func localize() {
        title = "welcomeScreen.title".localized
    }
}
