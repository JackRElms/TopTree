//
//  Top_TreeApp.swift
//  Shared
//
//  Created by Jack Elms on 03/04/2021.
//

import SwiftUI

@main
struct Top_TreeApp: App {
    let persistenceController = PersistentContainer.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        PersistentContainer.shared.setup()
        return true
    }
}
