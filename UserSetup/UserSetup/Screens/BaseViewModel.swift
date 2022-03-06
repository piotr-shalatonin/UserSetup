//
//  BaseViewModel.swift
//  UserSetup
//
//  Created by Piotr Shalatonin on 7.03.22.
//

import Foundation

class BaseViewModel {
    var user: User!
    
    private let storageManager: StorageManagerProtocol
    
    init(storageManager: StorageManagerProtocol = StorageManager()) {
        self.storageManager = storageManager
        loadData()
    }
    
    private func loadData() {
        user = storageManager.getUser()
    }
    
    func saveData() {
        storageManager.save(user: user)
    }
}
