//
//  CoreDataStack.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        self.container.viewContext
    }
    
    init() {
        self.container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Can't load store. Unexpected error \(error)")
            }
        }
    }
}
