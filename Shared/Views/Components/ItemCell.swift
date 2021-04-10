//
//  ItemCell.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct ItemCell: View {
    
    @State var task: Task
    @Binding var showingSheet: Bool
    @Binding var selectedItem: String
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            if task.name!.count > 0 {
                Text(task.name!)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding()
                    .truncationMode(.tail)
            } else {
                Text("Empty")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding()
                    .truncationMode(.tail)
            }
            Spacer()
            Button(action: {
                selectedItem = task.id!.uuidString
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
        .padding([.bottom],10)
    }
}

