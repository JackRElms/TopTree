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
        
                    item.name = "Walk the Dog \(index)"
                    item.completed = true
                    item.startMood = Mood.happy
                    item.endMood = Mood.happy
                    item.lastModifiedDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate) ?? creationDate
                    item.creationDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate)
                }

                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one inserted \(numberOfSamples) tasks")
            } catch {
                print("### \(#function): Failed to insert tasks in batch: \(error)")
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
                print("### \(#function): Failed to create Task: \(error)")
            }
        }
    }
}
