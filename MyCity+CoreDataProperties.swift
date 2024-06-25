//
//  MyCity+CoreDataProperties.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 26.06.2024.
//
//

import Foundation
import CoreData


extension MyCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyCity> {
        return NSFetchRequest<MyCity>(entityName: "MyCity")
    }

    @NSManaged public var city: String?

}

extension MyCity : Identifiable {

}
