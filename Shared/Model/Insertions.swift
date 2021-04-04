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
        
                    item.nameOne = String(format: "Generated %05d", index)
                    item.nameTwo = String(format: "Generated %05d", index)
                    item.nameThree = String(format: "Generated %05d", index)
                    item.completedOne = true
                    item.completedTwo = true
                    item.completedThree = false
                    item.startMood = Mood.happy
                    item.endMood = Mood.happy
                    item.lastModifiedDate = creationDate
                    item.creationDate = creationDate
                }

                try taskContext.save()
                taskContext.reset()
                print("### \(#function): One by one inserted \(numberOfSamples) posts")
            } catch {
                print("### \(#function): Failed to insert articles in batch: \(error)")
            }
        }
    }
}
