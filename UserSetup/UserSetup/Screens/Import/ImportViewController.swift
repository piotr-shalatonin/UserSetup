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
        
        localize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadData()
    }
    
    private func localize() {
        title = viewModel.title
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch (identifier, segue.destination) {
            case (GlobalConstants.UI.weightSegue, let viewController as WeightViewController):
                viewController.viewModel = WeightViewModel()
            default:
                break
            }
        }
    }
}
