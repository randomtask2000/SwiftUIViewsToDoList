//
//  SwiftUIViewsApp.swift
//  SwiftUIViews
//
//  Created by Emilio Nicoli on 12/3/20.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoList().environmentObject(ToDoStorage())
        }
    }
}
