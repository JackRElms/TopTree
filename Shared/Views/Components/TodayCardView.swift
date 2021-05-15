//
//  TodayCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI

struct TodayCardView: View {
    
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var todaysTasks: FetchedResults<Task>
        
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
                        Text("2")
                            .foregroundColor(.green) +
                        Text(" Tasks completed")
                            .foregroundColor(.green)
                    })
                    .padding(.bottom, -3.0)
                    .font(.headline)
                    Text("Almost there, you only have ")
                        .foregroundColor(Color(UIColor.secondaryLabel)) +
                    Text("1 task left.")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .fontWeight(.medium)
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
