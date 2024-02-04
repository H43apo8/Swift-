//
//  SomeEntity+CoreDataProperties.swift
//  CreateAppCodeForGB
//
//  Created by Максим Бобков on 25.01.2024.
//
//

import Foundation
import CoreData


extension SomeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SomeEntity> {
        return NSFetchRequest<SomeEntity>(entityName: "SomeEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int32

}

extension SomeEntity : Identifiable {

}
