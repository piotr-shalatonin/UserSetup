//
//  BirthViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class BirthViewModel: BaseViewModel {
    
    func validate() -> Bool {
        guard let dateOfBirth = user.dateOfBirth else {
            return false
        }
        
        guard GlobalUtils.age(for: dateOfBirth) >= GlobalConstants.User.minimumAge else {
            return false
        }
        
        return true
    }
    
    var title: String {
        "birthScreen.title".localized
    }
    
    var datePickerDate: Date {
        if let dateOfBirth = user.dateOfBirth {
            return dateOfBirth
        } else {
            return Date()
        }
    }
    
    var birthdayTextFieldText: String {
        GlobalUtils.string(from: datePickerDate, format: GlobalConstants.UI.dateOfBirthFormat)
    }
    
}
