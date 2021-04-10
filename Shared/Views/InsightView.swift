//
//  SwiftUIView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 04/04/2021.
//

import SwiftUI

struct InsightView: View {
    @State var iosGridLayout = [ GridItem(.flexible()) ]
    @State var ipadosGridLayout = [ GridItem(.flexible()), GridItem(.flexible()) ]

    var task: Task
    
    private func determineGridLayout() -> Array<GridItem> {
        var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
        if idiom == .pad {
            return [ GridItem(.flexible()), GridItem(.flexible()) ]
        } else {
            return [ GridItem(.flexible()) ]
        }
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: determineGridLayout()) {
                TodayCardView(task: task)
                TotalCardView(task: task)
                MostProductiveCardView(task: task)
            }
            .padding(.all, 10)
            .animation(.interactiveSpring())
            .navigationBarTitle("Insights")
        }
    }
}
