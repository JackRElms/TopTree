//
//  TodayCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI

struct TodayCardView: View {
    
    var task: Task
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(height: 210)
            VStack(alignment: .leading, spacing: 5, content: {
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack(content: {
                        Image(systemName: "calendar.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                        
                        Text("Today")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(UIColor.label))
                    }).padding(.bottom, 2)
                    Text("2 Completed")
                        .font(.body)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    Text("Almost there, you only have 1 task left")
                        .font(.body)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                })
                VStack(alignment: .leading, spacing: 6, content: {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text(task.name!)
                    }
                })
                .padding(.top, 5)
            })
            .padding()
        })
    }
}
