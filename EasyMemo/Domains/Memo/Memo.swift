//
//  Memo.swift
//  EasyMemo
//
//  Created by Toshimitsu Kugimoto on 2024/01/08.
//

import Foundation
import SwiftData

@Model
final class Memo {
    var content: String
    var createdAt: Date
    var updatedAt: Date
    
    init(content: String) {
        self.content = content
        createdAt = Date()
        updatedAt = Date()
    }
}
