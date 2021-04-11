//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var tasks: FetchedResults<Task>
    @State var selectedTask = Task()

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: nil, content: {
                    ForEach(tasks, id: \.self) { task in
                        ItemCell(task: task, showingSheet: $showingSheet, selectedTask: $selectedTask)
                    }
                    
                }).padding(.top, 20)
            }
            .navigationBarTitle("Today")
        }.sheet(isPresented: $showingSheet, content: {
            AddTaskSheetView(selectedTask: $selectedTask)
        })
    }
}

