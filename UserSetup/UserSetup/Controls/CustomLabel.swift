//
//  CustomLabel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    @IBInspectable var localizationKey: String = "" {
        didSet {
            self.text = localizationKey.localized
        }
    }
}
