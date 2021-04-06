//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: nil, content: {
                    ItemCell(showingSheet: $showingSheet)
                    ItemCell(showingSheet: $showingSheet)
                    ItemCell(showingSheet: $showingSheet)
                })
            }
            .navigationBarTitle("Today")
        }.sheet(isPresented: $showingSheet, content: {
            AddItemSheetView()
        })
    }
}


class ShowingSheet: ObservableObject {

    @Published var showingSheet: Bool = false
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewDevice("iPhone 11 Pro")
    }
}
