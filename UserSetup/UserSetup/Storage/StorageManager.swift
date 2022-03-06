//
//  StorageManager.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 6.03.22.
//

import Foundation

enum Gender: Int {
    case male = 0
    case female = 1
}

enum WeightUnit : Int {
    case kg = 0
    case pound = 1
}

struct User {
    var gender: Gender?
    var weight: Float?
    var weightUnit: WeightUnit?
    var dateOfBirth: Date?
}

protocol StorageManagerProtocol {
    func save(user: User)
    func getUser() -> User
}

class StorageManager {
    var defaults = UserDefaults.standard
    enum Constants {
        static let genderKey = "gender"
        static let weightKey = "weight"
        static let weightUnitKey = "weightUnit"
        static let dateOfBirthKey = "dateOfBirth"
    }
    
    func saveField(value: Any?, forKey key: String) {
        if let value = value {
            defaults.set(value, forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }
}

extension StorageManager: StorageManagerProtocol {
    func save(user: User) {
        saveField(value: user.gender?.rawValue, forKey: Constants.genderKey)
        saveField(value: user.weight, forKey: Constants.weightKey)
        saveField(value: user.weightUnit?.rawValue, forKey: Constants.weightUnitKey)
        saveField(value: user.dateOfBirth?.timeIntervalSince1970, forKey: Constants.dateOfBirthKey)
    }
    
    func getUser() -> User {
        var user = User()
        
        if defaults.object(forKey: Constants.genderKey) != nil {
            user.gender = Gender(rawValue: defaults.integer(forKey: Constants.genderKey))
        }
        if defaults.object(forKey: Constants.weightKey) != nil {
            user.weight = defaults.float(forKey: Constants.weightKey)
        }
        if defaults.object(forKey: Constants.weightUnitKey) != nil {
            user.weightUnit = WeightUnit(rawValue: defaults.integer(forKey: Constants.weightUnitKey))
        }
        if defaults.object(forKey: Constants.dateOfBirthKey) != nil {
            let timeInterval = defaults.double(forKey: Constants.dateOfBirthKey)
            user.dateOfBirth = Date(timeIntervalSince1970: timeInterval)
        }
        
        return user
    }
}
