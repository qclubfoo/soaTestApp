//
//  VCDataModel.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IVCDataModelDelegate {
    func setup(dataSource: [String])
}

protocol IVCDataModel {
    var delegate: IVCDataModelDelegate? { get }
    func getNewData()
    func addNewData(text: String)
}

class VCDataModel: IVCDataModel {
    
    var delegate: IVCDataModelDelegate?
    var storageService: IDataProvider
    
    init(storageService: IDataProvider) {
        self.storageService = storageService
    }
    
    func getNewData() {
        storageService.getData{ strings in
            delegate?.setup(dataSource: strings)
        }
    }
    
    func addNewData(text: String) {
        storageService.saveData(text: text)
    }
    
    
}
