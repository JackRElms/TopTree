//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @State var selectedTask = Task()
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var tasks: FetchedResults<Task>

    func renderCells(index: Int) -> ItemCell {
        for task in tasks
        {
            if task.taskOrder == index {
                return ItemCell(task: task, showingSheet: $showingSheet, selectedTask: $selectedTask)
            }
        }
        let taskContext = PersistentContainer.shared.newBackgroundContext()

        let emptyTask = Task(context: taskContext)
        return ItemCell(task: emptyTask, showingSheet: $showingSheet, selectedTask: $selectedTask)
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack {
                    Text(Date().renderMediumDate())
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .font(.title3)
                        .padding(.leading, 20)
                    Spacer()
                }
                Divider()
                VStack(alignment: .leading, spacing: nil, content: {
                    ForEach((1...3), id: \.self) {
                        renderCells(index: $0)
                    }
                }).padding(.top, 20)
            }
            .navigationBarTitle("Today")
        }.sheet(isPresented: $showingSheet, content: {
            AddTaskSheetView(selectedTask: $selectedTask)
        })
    }
}

