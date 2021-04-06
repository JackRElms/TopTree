//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @StateObject var item = ItemInstance()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: nil, content: {
                    ItemCell(showingSheet: $showingSheet, task: $item.nameOne)
                    ItemCell(showingSheet: $showingSheet, task: $item.nameTwo)
                    ItemCell(showingSheet: $showingSheet, task: $item.nameThree)
                })
            }
            .navigationBarTitle("Today")
        }.sheet(isPresented: $showingSheet, content: {
            AddItemSheetView()
                .environmentObject(item)
        })
    }
}


class ItemInstance: ObservableObject {
    @Published var nameOne = ""
    @Published var nameTwo = ""
    @Published var nameThree = ""
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewDevice("iPhone 11 Pro")
    }
}
