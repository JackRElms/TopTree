//
//  ItemCell.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct ItemCell: View {
    
    @Binding var showingSheet: Bool
    @State var task: Item
    @State var selectedTask: Item?
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text(task.name)
                .font(.title)
                .bold()
                .foregroundColor(Color(UIColor.secondaryLabel))
                .padding()
                .truncationMode(.tail)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .padding()
        })
        .background(RoundedRectangle(cornerRadius: 10, style: .circular)
            .fill(Color(UIColor.secondarySystemBackground))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .allowsHitTesting(false))
            .padding([.leading, .trailing],25)
            .padding(.bottom,10)
    }
}

