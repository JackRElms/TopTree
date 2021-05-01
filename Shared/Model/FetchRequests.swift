//
//  FetchRequests.swift
//  Core Data Best Practices
//
//  Created by Antoine van der Lee on 05/11/2020.
//

import Foundation
import CoreData

extension Task {
    @objc static func listAllFetchRequest() -> NSFetchRequest<Task> {
        let fetchRequest = Task.fetchRequest

        // ORDER BY t0.ZNAME
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Task.creationDate), ascending: false)]

        // LIMIT 20
        fetchRequest.fetchBatchSize = 20

        // 'SELECT 1, t0.Z_PK, t0.ZNAME, t0.ZCATEGORYNAME FROM ZARTICLE t0 WHERE  t0.Z_PK IN (SELECT * FROM _Z_intarray0)   LIMIT 20'
        fetchRequest.propertiesToFetch = [
            #keyPath(Item.name),
            #keyPath(Item.completed),
            #keyPath(Item.creationDate),
        ]
        
        return fetchRequest
    }
    
    static func fetchTodaysTasks() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        
        request.sortDescriptors = [NSSortDescriptor(key: "taskOrder", ascending: true)]
          
        return request
    }
    
    static func fetchTask(id: UUID) -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        
        request.sortDescriptors = [NSSortDescriptor(key: "taskOrder", ascending: true)]
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id as UUID as CVarArg)
          
        return request
    }
}

/// Defines a convenience class for `NSManagedObject` types to add common methods and remove boilerplate code.
public protocol Managed: class, NSFetchRequestResult {
    static var entityName: String { get }
}

extension NSManagedObject: Managed { }
public extension Managed where Self: NSManagedObject {
    /// Returns a `String` of the entity name.
    static var entityName: String { return String(describing: self) }

    /// Creates a `NSFetchRequest` which can be used to fetch data of this type.
    static var fetchRequest: NSFetchRequest<Self> {
        return NSFetchRequest<Self>(entityName: entityName)
    }
}
