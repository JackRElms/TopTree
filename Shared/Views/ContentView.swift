//
//  ContentView.swift
//  Shared
//
//  Created by Jack Elms on 03/04/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.creationDate, ascending: false)]) var tasks: FetchedResults<Task>
    @State private var showActionSheet = false
    @State private var selection = 2

    var body: some View {
        VStack {
            
            TabView(selection: $selection) {
                NavigationView {
                    List(tasks, id: \.self) { task in
                        NavigationLink(destination: InsightView(task: task)) { Text(task.creationDate!, style: .date) }
                    }
                    .navigationBarTitle("Top Tree")
                    .navigationBarItems(trailing:
                        Button(action: {
                            showActionSheet = true
                        }) {
                            Image(systemName: "ellipsis.circle.fill").imageScale(.large)
                        }.actionSheet(isPresented: $showActionSheet, content: {
                            ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
                                .default(Text("Insert 5")) { try! Task.insertSamplesOneByOne(5)},
                                .default(Text("Insert 1")) { try! Task.createTask("Name", taskOrder: 1)},
                                .destructive(Text("Delete")) { try! Task.deleteAllOneByOne()}
                            ])
                        })
                    )
                    
                }.tabItem { Text("Top Tree") }.tag(1)
                TodayView().tabItem { Text("Insights") }.tag(2)
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
