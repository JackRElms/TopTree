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
    @State private var showActionSheet = false
    @State private var selection = 2

    
        #if os(iOS)
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
        #endif
        
        @ViewBuilder var body: some View {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                NavigationView {
                    TabView {
                        TodayView()
                            .tabItem {
                                Label("Today", systemImage: "calendar.circle.fill")
                            }
                        InsightView()
                            .tabItem {
                                Label("Insights", systemImage: "star.circle.fill")
                            }
                    }
                    .navigationBarTitle("Top Tree")
                    .navigationBarItems(trailing:
                        Button(action: {
                            showActionSheet = true
                        }) {
                            Image(systemName: "ellipsis.circle.fill").imageScale(.large)
                        }.actionSheet(isPresented: $showActionSheet, content: {
                            ActionSheet(title: Text("Actions"), message: Text("Choose Option"), buttons: [
                                .default(Text("Insert 5")) { try! Task.insertSamplesOneByOne(5)},
                                .destructive(Text("Delete All")) { try! Task.deleteAllOneByOne()},
                                .cancel()
                            ])
                        })
                    )
                }
            } else {
                NavigationView {
                    List{
                        NavigationLink(destination: TodayView()) { Label("Today", systemImage: "calendar.circle.fill") }
                        NavigationLink(destination: InsightView()) { Label("Insights", systemImage: "star.circle.fill") }
                    }
                    .listStyle(SidebarListStyle())
                    .navigationBarTitle("Top Tree")
                    .navigationBarItems(trailing:
                        Button(action: {
                            showActionSheet = true
                        }) {
                            Image(systemName: "ellipsis.circle.fill").imageScale(.large)
                        }.actionSheet(isPresented: $showActionSheet, content: {
                            ActionSheet(title: Text("Actions"), message: Text("Choose Option"), buttons: [
                                .default(Text("Insert 5")) { try! Task.insertSamplesOneByOne(5)},
                                .destructive(Text("Delete All")) { try! Task.deleteAllOneByOne()},
                                .cancel()
                            ])
                        })
                    )
                }
            }
            #endif
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
