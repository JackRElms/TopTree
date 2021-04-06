//
//  ItemCell.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct ItemCell: View {
    
    @Binding var showingSheet: Bool
    @Binding var task: String
    
    init(showingSheet: Binding<Bool>, task: Binding<String>) {
        self._showingSheet = showingSheet
        self._task = task
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text(task)
                .font(.title2)
                .bold()
                .foregroundColor(Color(UIColor.secondaryLabel))
                .padding()
                .truncationMode(.tail)
            Spacer()
            Button(action: {
                showingSheet.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
            }
            .padding()
        })
        .background(RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color.white)
                        .shadow(color: Color(UIColor.systemGray5), radius: 8, x: 0, y: 2)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .allowsHitTesting(false))
        .padding([.leading, .trailing],25)

    }
}

