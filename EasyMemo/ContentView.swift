//
//  ContentView.swift
//  EasyMemo
//
//  Created by Toshimitsu Kugimoto on 2024/01/08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        MemoListScreen()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self, inMemory: true)
}
