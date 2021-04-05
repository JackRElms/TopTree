//
//  TotalCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI


struct TotalCardView: View {
    
    var item: Item
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(height: 210)
            VStack(alignment: .leading, spacing: 5, content: {
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack(content: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                        
                        Text("Total")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(UIColor.label))
                    }).padding(.bottom, 2)
                    Text("You've completed 64 tasks this month. That's 6 more than before!")
                        .font(.body)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    HStack(content: {
                        Text("64")
                            .font(.title)
                            .foregroundColor(Color(UIColor.label))
                        Text("Tasks completed")
                            .font(.title)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }).padding([.top, .bottom])
                })
            })
            .padding()
        })
    }
}
