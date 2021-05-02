//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @State var selectedTask: Task?
    @State var listId = UUID()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.creationDate, ascending: false)]) var items: FetchedResults<Task>
    
    init() {
        self.selectedTask = nil
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: nil, content: {
                ForEach(items, id: \.self) { task in
                    ItemCell(task: task)
                        .onTapGesture {
                            self.selectedTask = task
                            self.showingSheet = true
                        }
                }.id(listId)
            })
        }
        .sheet(isPresented: $showingSheet, content: {
            AddItemSheetView(task: self.$selectedTask, listId: $listId)
        })
    }
}
