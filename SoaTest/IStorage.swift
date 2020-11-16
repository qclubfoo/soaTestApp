//
//  IStorage.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IStorage {
    func saveData(text: String)
    func loadData(completion: ([String]) -> (Void))
}
