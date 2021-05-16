//
//  Today.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 15/05/2021.
//

import Foundation
import SwiftUI

class Insight {
    func remainingTodayMotivation(numberOfRemainingTasks: Int) -> String {
        switch numberOfRemainingTasks {
        case 1:
            return "Almost there, you only have"
        default:
            return "You've completed all your tasks today. Good job!"
        }
    }
    
    func processTodaysTasks() -> TodayInsight{
        let tasks: [Task]
        var processedData = TodayInsight()
        
        do {
            tasks = try PersistentContainer.shared.viewContext.fetch(Task.fetchTodaysTasks())
            for task in tasks {
                if task.completed == true {
                    processedData.numberOfCompletedTasks += 1
                } else {
                    processedData.numberOfUncompletedTasks += 1
                }
            }
            processedData.remainingTodayMotivation = remainingTodayMotivation(numberOfRemainingTasks: processedData.numberOfUncompletedTasks)
        } catch {
            print(error)
        }
        return processedData
    }
}

struct TodayInsight {
    var numberOfCompletedTasks = 0
    var numberOfUncompletedTasks = 0
    var remainingTodayMotivation = ""
}
