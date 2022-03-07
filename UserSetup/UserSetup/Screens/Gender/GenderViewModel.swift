//
//  GenderViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

class GenderViewModel: BaseViewModel {
    
    func setGender(gender: Gender) {
        user.gender = gender
    }
    
    var title: String {
        "genderScreen.title".localized
    }
    
}
