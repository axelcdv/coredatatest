//
//  Person+CoreDataProperties.swift
//  Pods
//
//  Created by Axel Colin de Verdiere on 27/11/2015.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var height: NSNumber?

}
