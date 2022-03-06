//
//  CustomButton.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 4.03.22.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    @IBInspectable var localizationKey: String = "" {
        didSet {
            self.setTitle(localizationKey.localized, for: .normal)
        }
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            customize()
    }
    
    private func customize() {
        backgroundColor = .greenButton
        setTitleColor(.white, for: .normal)
    }
}
