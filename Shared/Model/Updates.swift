//
//  Updates.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 11/04/2021.
//

import Foundation
import CoreData

extension Task {
    static func updateTask(_ task: Task) throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let fetchRequest = self.fetchRequest()
                fetchRequest.entity = Task.entity()
                fetchRequest.predicate = NSPredicate(format: "uuid == %@", task.uuid! as CVarArg)
                let results = try taskContext.fetch(fetchRequest)
                let objectUpdate = results[0] as! NSManagedObject
                
                let modifiedDate = Date()
                objectUpdate.setValue(task.name, forKey: "name")
                objectUpdate.setValue(task.completed, forKey: "completed")
                objectUpdate.setValue(modifiedDate, forKey: "lastModifiedDate")

                do {
                    try taskContext.save()
                }
            } catch {
                print("### \(#function): Failed to update Task: \(error)")
            }
        }
    }
}
