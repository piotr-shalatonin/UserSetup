//
//  WeightViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class WeightViewModel: BaseViewModel {
    
    var helpLabelText: String {
        String(
            format: "weightScreen.weightHelpLabel".localized,
            "pounds",
            String(198),
            String(220.5)
        )
    }
    
    func setWeight(weight: Float) {
        user.weight = weight
    }
}
