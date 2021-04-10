//
//  TodayView.swift
//  Top Tree (iOS)
//
//  Created by Jack Elms on 05/04/2021.
//

import SwiftUI

struct TodayView: View {

    @State var showingSheet = false
    @State var selectedItem = ""
    @FetchRequest(fetchRequest: Task.fetchTodaysTasks()) var tasks: FetchedResults<Task>

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: nil, content: {
                    ForEach(tasks, id: \.self) { task in
                        ItemCell(task: task, showingSheet: $showingSheet, selectedItem: $selectedItem)
                    }
                    
                }).padding(.top, 20)
            }
            .navigationBarTitle("Today")
        }.sheet(isPresented: $showingSheet, content: {
            switch selectedItem {
            case "nameOne":
                AddTaskSheetView(tasks: FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "task.id = %@", selectedItem)), showingSheet: $showingSheet, selectedItem: $selectedItem)
            default:
                AddTaskSheetView(tasks: FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "task.id = %@", selectedItem)), showingSheet: $showingSheet, selectedItem: $selectedItem)
            }
        })
    }
}


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewDevice("iPhone 11 Pro")
    }
}
