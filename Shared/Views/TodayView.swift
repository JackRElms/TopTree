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
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var todaysTasks: FetchedResults<Task>

    init() {
        self.selectedTask = nil
    }
        
    @ViewBuilder
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: nil, content: {
                ForEach(todaysTasks, id: \.self) { task in
                    ItemCell(task: task)
                        .onTapGesture {
                            self.selectedTask = task
                            self.showingSheet = true
                        }
                }.id(listId)
                if todaysTasks.count < 3 {
                    EmptyCell()
                        .onTapGesture {
                            self.selectedTask = nil
                            self.showingSheet = true
                        }
                }
            })
        }
        .sheet(isPresented: $showingSheet, content: {
            AddItemSheetView(task: self.$selectedTask, listId: $listId)
        })
    }
}
