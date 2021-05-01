//
//  Insertions.swift
//  Core Data Best Practices
//
//  Created by Antoine van der Lee on 03/11/2020.
//

import Foundation
import CoreData

extension Item {
    static func insertSamplesOneByOne(_ numberOfSamples: Int) throws {
        let taskContext = PersistentContainer.shared.newBackgroundContext()
        taskContext.perform {
            do {
                let creationDate = Date()

                (0..<numberOfSamples).forEach { index in
                    let item = Item(context: taskContext)
        
                    item.name = "Walk the Dog \(index)"
                    item.completed = true
                    item.startMood = Mood.happy
                    item.endMood = Mood.happy
                    item.lastModifiedDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate) ?? creationDate
                    item.creationDate = Calendar.current.date(byAdding: .day, value: -index, to: creationDate)
                }

                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one inserted \(numberOfSamples) posts")
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
