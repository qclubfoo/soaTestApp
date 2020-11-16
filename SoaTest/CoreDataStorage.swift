//
//  CoreDataStorage.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStorage: IStorage {
    
    var coreDataStack = CoreDataStack()
    
    var context: NSManagedObjectContext {
        self.coreDataStack.viewContext
    }
    
    func saveData(text: String) {
        let newObject = TextEntity(context: context)
        newObject.text = text
        try? context.save()
    }
    
    func loadData(completion: ([String]) -> (Void)) {
        let fetchRequest = TextEntity.createFetchRequest()
        if let fetchRequestResult = try? context.fetch(fetchRequest) {
            var resultsArray = [String]()
            for result in fetchRequestResult {
                resultsArray.append(result.text)
            }
            completion(resultsArray)
        } else {
            completion([String]())
        }
        
    }
    
}
