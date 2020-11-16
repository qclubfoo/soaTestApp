//
//  ServiceAssembly.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IServiceAssembly {
    var dataProvider: IDataProvider { get }
}

class ServiceAssembly: IServiceAssembly {
    private let coreAssembly: ICoreAssembly
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    lazy var dataProvider: IDataProvider = DataProvider(storage: self.coreAssembly.coreData)
}
