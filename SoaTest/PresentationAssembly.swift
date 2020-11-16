//
//  PresentationAssembly.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IPresentationAssembly {
    func viewController() -> ViewController
}

class PresentationAssembly: IPresentationAssembly {
    private var serviceAssembly: IServiceAssembly
    
    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    func viewController() -> ViewController {
        let vc = ViewController.storyboardInstance()
        let model = VCDataModel(storageService: self.serviceAssembly.dataProvider)
        model.delegate = vc
        vc.model = model
        vc.presentationAssembly = self
        return vc
    }
    
    
}
