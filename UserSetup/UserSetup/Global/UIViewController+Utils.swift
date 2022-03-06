//
//  UIViewController+Utils.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "common.button.ok".localized,
                style: .default,
                handler: nil
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
}
