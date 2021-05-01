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
        NavigationView {
            List{
                NavigationLink(destination: TodayView()) { Label("Today", systemImage: "calendar.circle.fill") }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Top Tree")
            .navigationBarItems(trailing:
                Button(action: {
                    showActionSheet = true
                }) {
                    Image(systemName: "ellipsis.circle.fill").imageScale(.large)
                }.actionSheet(isPresented: $showActionSheet, content: {
                    ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
                        .default(Text("Insert")) { try! Item.insertSamplesOneByOne(5)},
                        .destructive(Text("Delete")) { try! Item.deleteAllOneByOne()}
                    ])
                })
            )
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
