//
//  EasyMemoApp.swift
//  EasyMemo
//
//  Created by Toshimitsu Kugimoto on 2024/01/08.
//

import SwiftUI
import SwiftData

@main
struct EasyMemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Memo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
