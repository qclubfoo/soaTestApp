//
//  DataProvider.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IDataProvider {
    var storage: IStorage { get }
    
    func getData(completion: ([String]) -> (Void))
    func saveData(text: String)
}

class DataProvider: IDataProvider {
    
    var storage: IStorage
    
    init(storage: IStorage) {
        self.storage = storage
    }
    
    func getData(completion: ([String]) -> (Void)) {
        storage.loadData(completion: completion)
    }
    
    func saveData(text: String) {
        storage.saveData(text: text)
    }
    
    
}
