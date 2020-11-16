//
//  TextEntity+CoreDataProperties.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//
//

import Foundation
import CoreData


extension TextEntity {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<TextEntity> {
        return NSFetchRequest<TextEntity>(entityName: "TextEntity")
    }

    @NSManaged public var text: String

}
