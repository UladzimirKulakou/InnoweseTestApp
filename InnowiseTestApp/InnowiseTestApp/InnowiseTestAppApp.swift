//
//  InnowiseTestAppApp.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 19.04.23.
//

import SwiftUI

@main
struct InnowiseTestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
