//
//  MostProductiveCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI


struct MostProductiveCardView: View {
    
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var todaysTasks: FetchedResults<Task>

        
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(minHeight: 135)
            HStack(alignment: .top, spacing: 5, content: {
                Image(systemName: "star.circle.fill")
                    .padding(.trailing, 8.0)
                    .font(.system(size: 40))
                    .foregroundColor(.green)
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Most Productive")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.label))
                        .padding(.bottom, -6.0)
                    HStack(content: {
                        Text("Thursday")
                            .foregroundColor(.green)
                    })
                    .padding(.bottom, -3.0)
                    .font(.headline)
                    Text("You completed all your tasks on ")
                        .foregroundColor(Color(UIColor.secondaryLabel)) +
                        Text("Thursday.")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .fontWeight(.medium) +
                    Text("Great job!")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                })
            })
            .padding()
        })
    }
}
