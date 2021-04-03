//
//  Top_TreeApp.swift
//  Shared
//
//  Created by Jack Elms on 03/04/2021.
//

import SwiftUI

@main
struct Top_TreeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
