//
//  AddMemoView.swift
//  EasyMemo
//
//  Created by Toshimitsu Kugimoto on 2024/01/08.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentation
    
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            Form {
                TextField(
                    text: $content,
                    prompt: Text("Required"),
                    axis: .vertical
                ) {
                    Text("Content")
                }
                .lineLimit(5...10)
            }
        }
        .navigationBarTitle("Add new memo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {add()}) {
                    Text("Save")
                }
            }
        }
    }
    
    private func add() {
        let newMemo = Memo(content: content)
        context.insert(newMemo)
        
        // go back to previous page
        presentation.wrappedValue.dismiss()
    }
}

#Preview {
    AddMemoView()
}
