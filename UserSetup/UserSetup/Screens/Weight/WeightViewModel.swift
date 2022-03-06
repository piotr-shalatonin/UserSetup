//
//  WeightViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class WeightViewModel {
    var helpLabelText: String {
//        "weightScreen.weightHelpLabel".localized
        String(
            format: "weightScreen.weightHelpLabel".localized,
            "pounds",
            String(198),
            String(220.5)
        )
    }
}
