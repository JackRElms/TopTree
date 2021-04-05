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
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.creationDate, ascending: false)]) var items: FetchedResults<Item>
    @State private var showActionSheet = false

    var body: some View {
        VStack {
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                NavigationView {
                    List(items, id: \.self) { item in
                        NavigationLink(destination: InsightView(item: item)) { Text(item.creationDate, style: .date) }
                    }
                    .navigationBarTitle("Top Tree")
                    .navigationBarItems(trailing:
                        Button(action: {
                            print("User icon pressed...")
                        }) {
                            Image(systemName: "person.crop.circle").imageScale(.large)
                        }
                    )
                    .navigationBarItems(trailing:
                        Button(action: {
                            showActionSheet = true
                        }) {
                            Image(systemName: "ellipsis.circle.fill").imageScale(.large)
                        }.actionSheet(isPresented: $showActionSheet,
                                      content: {
                                          ActionSheet(title: Text("ActionSheet"))
                             })
                    )
                    
                }.tabItem { Text("Top Tree") }.tag(1)
                Text("Tab Content 2").tabItem { Text("Insights") }.tag(2)
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
