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

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: InsightView(item: item)) { Text(item.creationDate, style: .date) }
            }
            .navigationBarTitle("Top Tree")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Insert") {
                        try! Item.insertSamplesOneByOne(5)
                    }
                    Spacer()
                    Button("Delete") {
                        try! Item.deleteAllOneByOne()
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
