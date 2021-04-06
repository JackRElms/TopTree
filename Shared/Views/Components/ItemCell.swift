//
//  ItemCell.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 06/04/2021.
//

import SwiftUI

struct ItemCell: View {
    
    @Binding var showingSheet: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text("Empty")
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

struct ItemCell_Previews: PreviewProvider {
    
    @State static var showingSheet = false
    
    static var previews: some View {
        ItemCell(showingSheet: $showingSheet)
            .previewDevice("iPhone 11 Pro")
    }
}
