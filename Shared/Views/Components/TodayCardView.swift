//
//  TodayCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI

struct TodayCardView: View {
    
    var processedTasks: TodayInsight
    let insight = Insight()
    
    init() {
        processedTasks = insight.processTodaysTasks()
    }
        
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(minHeight: 135)
            HStack(alignment: .top, spacing: 5, content: {
                Image(systemName: "calendar.circle.fill")
                    .padding(.trailing, 8.0)
                    .font(.system(size: 40))
                    .foregroundColor(.green)
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Today")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.label))
                        .padding(.bottom, -6.0)
                    
                    HStack(content: {
                        Text(String(processedTasks.numberOfCompletedTasks))
                            .foregroundColor(.green)
                        if processedTasks.numberOfCompletedTasks == 1 {
                            Text("Task completed")
                                .foregroundColor(.green)
                        } else {
                            Text("Tasks completed")
                                .foregroundColor(.green)
                        }
                    })
                    .padding(.bottom, -3.0)
                    .font(.headline)
                    
                    HStack {
                        Text(processedTasks.remainingTodayMotivation)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        if processedTasks.numberOfUncompletedTasks > 0 {
                            Text(String(processedTasks.numberOfUncompletedTasks))
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .fontWeight(.medium)
                            switch processedTasks.numberOfUncompletedTasks {
                            case 1:
                                Text("Task left")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                    .fontWeight(.medium)
                            default:
                                Text("Tasks left")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                    .fontWeight(.medium)
                            }
                        }
                    }
                })
            })
            .padding()
        })
    }
}


struct TodayCardView_Previews: PreviewProvider {
    static var previews: some View {
        TodayCardView()
    }
}
