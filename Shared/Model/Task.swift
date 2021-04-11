//
//  Item+CoreDataProperties.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 03/04/2021.
//
//

import Foundation
import CoreData


final class Task: NSManagedObject, Identifiable {

//    @objc enum Mood: Int64 {
//        case unknown
//        case happy
//        case sad
//        case angry
//        case lonely
//        case veryUnmotivated
//    }
    
    @NSManaged public var completed: Bool
    @NSManaged public var creationDate: Date?
    @NSManaged public var lastModifiedDate: Date?
    @NSManaged public var name: String
    @NSManaged public var taskOrder: Int64
    @NSManaged public var uuid: UUID?

}
