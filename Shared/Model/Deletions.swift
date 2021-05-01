//
//  Deletions.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 11/04/2021.
//

import Foundation
import CoreData

extension Task {
    static func deleteAllOneByOne() throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let fetchRequest = self.fetchRequest()
                let objects = try taskContext.fetch(fetchRequest) as! [NSManagedObject]
                objects.forEach { object in
                    taskContext.delete(object)
                }
                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one deleted post count: \(objects.count)")
            } catch {
                print("### \(#function): Failed to delete existing records one by one: \(error)")
            }
        }
    }
}
