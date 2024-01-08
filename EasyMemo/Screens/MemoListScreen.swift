//
//  MemoListScreen.swift
//  EasyMemo
//
//  Created by Toshimitsu Kugimoto on 2024/01/08.
//

import SwiftUI
import SwiftData

struct MemoListScreen: View {
    @Environment(\.modelContext) private var context
    @Query private var memos: [Memo]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memos) { memo in
                    NavigationLink {
                        VStack(alignment: .leading) {
                            Text(memo.content)
                                .font(.title)
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 0,
                                    maxHeight: .infinity,
                                    alignment: .topLeading)
                                .padding()
                        }
                        .padding()
                    } label: {
                        Text(memo.content)
                            .font(.subheadline)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .lineLimit(1)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        delete(memo: memos[index])
                    }
                })
            }
            .navigationTitle("Memo")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMemoView()) {
                        Text("Add")
                    }
                }
            }
        }
    }

    private func delete(memo: Memo) {
        context.delete(memo)
    }
}

#Preview {
    MemoListScreen()
        .modelContainer(for: Memo.self)
}
