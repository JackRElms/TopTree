//
//  MostProductiveCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI


struct MostProductiveCardView: View {
    
    var task: Task
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(height: 200)
            VStack(alignment: .leading, spacing: 5, content: {
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack(content: {
                        Image(systemName: "star.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                        
                        Text("Most Productive")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(UIColor.label))
                    }).padding(.bottom, 2)
                    Text("You completed all 3 tasks on Thursday. Good job!")
                        .font(.body)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    VStack(alignment: .leading, spacing: 6, content: {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text(task.name!)
                        }
                    })
                    .padding(.top, 5)
                })
            })
            .padding()
        })
    }
}
