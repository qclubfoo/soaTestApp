//
//  CoreAssembly.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol ICoreAssembly {
    var coreData: IStorage { get }
}

class CoreAssembly: ICoreAssembly {
    lazy var coreData: IStorage = CoreDataStorage()
}
