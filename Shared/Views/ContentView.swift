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
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.startMood, ascending: false)]) var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: InsightView(item: item)) { Text(item.nameOne) }
            }
            .navigationBarTitle("Top Tree")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("First") {
                        try! Item.insertSamplesOneByOne(1000)
                    }
                }
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
