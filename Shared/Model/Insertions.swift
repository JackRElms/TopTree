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
        
                    task.name = "Walk the Dog \(index)"
                    task.completed = true
//                    task.startMood = Mood.happy
//                    task.endMood = Mood.happy
                    task.lastModifiedDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate) ?? creationDate
                    task.creationDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate)
                    task.uuid = UUID()
                }

                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one inserted \(numberOfSamples) tasks")
            } catch {
                print("### \(#function): Failed to insert tasks in batch: \(error)")
            }
        }
    }
    
    static func createTask(_ taskName: String) throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let task = Task(context: taskContext)
                task.name = taskName
                task.completed = false
                task.lastModifiedDate = Date()
                task.creationDate = Date()
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
