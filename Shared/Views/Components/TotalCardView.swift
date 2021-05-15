//
//  TotalCardView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import Foundation
import SwiftUI


struct TotalCardView: View {
        
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.tertiarySystemFill))
                .frame(minHeight: 135)
            HStack(alignment: .top, spacing: 5, content: {
                Image(systemName: "arrow.up.circle.fill")
                    .padding(.trailing, 8.0)
                    .font(.system(size: 40))
                    .foregroundColor(.green)
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Total")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.label))
                        .padding(.bottom, -6.0)
                    HStack(content: {
                        Text("64")
                            .foregroundColor(.green) +
                        Text(" Tasks completed")
                            .foregroundColor(.green)
                    })
                    .padding(.bottom, -3.0)
                    .font(.headline)
                    Text("You've completed ")
                        .foregroundColor(Color(UIColor.secondaryLabel)) +
                        Text("64 tasks this month. ")
                        .foregroundColor(Color(UIColor.secondaryLabel)) +
                    Text("That's 6 more than before!")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .fontWeight(.medium)
                })
            })
            .padding()
        })
    }
}

struct TotalCardView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCardView()
    }
}
