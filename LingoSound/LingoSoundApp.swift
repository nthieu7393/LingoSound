//
//  LingoSoundApp.swift
//  LingoSound
//
//  Created by hieu nguyen on 20/06/2024.
//

import SwiftUI

@main
struct LingoSoundApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
