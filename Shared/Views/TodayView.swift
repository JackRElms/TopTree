//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @State var selectedTask: Item?
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.creationDate, ascending: false)]) var items: FetchedResults<Item>
    
    init() {
        self.selectedTask = nil
    }
    
    var body: some View {
        let item = ItemInstance()
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: nil, content: {
                ForEach(items, id: \.self) { task in
                    ItemCell(showingSheet: $showingSheet, task: task, selectedTask: Item())
                        .environmentObject(item)
                        .onTapGesture {
                            self.selectedTask = task
                            self.showingSheet = true
                        }
                }
            })
        }
        .sheet(isPresented: $showingSheet, content: {
            AddItemSheetView(task: self.$selectedTask)
        })
    }
}


class ItemInstance: ObservableObject {
    @Published var name = ""
    @Published var completed = false
}
