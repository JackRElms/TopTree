//
//  Insertions.swift
//  Core Data Best Practices
//
//  Created by Antoine van der Lee on 03/11/2020.
//

import Foundation
import CoreData

extension Task {
    static func insertSamplesOneByOne(_ numberOfSamples: Int) throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let creationDate = Date()

                (0..<numberOfSamples).forEach { index in
                    let task = Task(context: taskContext)
        
                    task.name = "Walk the Dog"
                    task.completed = true
                    task.lastModifiedDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate) ?? creationDate
                    task.creationDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate)
                    task.taskOrder = Int64(index)
                    task.uuid = UUID()
                    print(task)
                }

                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one inserted \(numberOfSamples) posts")
            } catch {
                print("### \(#function): Failed to insert articles in batch: \(error)")
            }
        }
    }
    
    static func createTask(_ taskName: String, taskOrder: Int) throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let creationDate = Date()
                let task = Task(context: taskContext)
                task.name = "taskName"
                task.completed = true
                task.lastModifiedDate = creationDate
                task.creationDate = creationDate
                task.taskOrder = Int64(1)
                task.uuid = UUID()
                try taskContext.save()
                taskContext.reset()
                print("### \(#function): Created task - \(task.name)")
            } catch {
                print("### \(#function): Failed to insert articles in batch: \(error)")
            }
        }
    }
    
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
