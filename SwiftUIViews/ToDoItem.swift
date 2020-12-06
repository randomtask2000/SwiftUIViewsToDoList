//
//  ToDoItem.swift
//  SwiftUIViews
//
//  Created by Emilio Nicoli on 12/5/20.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
}

class ToDoStorage: ObservableObject {
    @Published var toDos = [ToDoItem]()
}
