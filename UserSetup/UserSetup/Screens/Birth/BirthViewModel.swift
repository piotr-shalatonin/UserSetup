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
    
}
