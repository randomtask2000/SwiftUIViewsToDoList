//
//  CreateToDo.swift
//  SwiftUIViews
//
//  Created by Emilio Nicoli on 12/5/20.
//

import SwiftUI

struct CreateToDo: View {
    @State var toDoTitle = ""
    @State var important = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var toDoStorage: ToDoStorage
    var body: some View {
        List {
            Section {
                TextField("e.g. Walk the dog", text:$toDoTitle)
            }
            Section {
                Toggle(isOn:$important) {
                    Text("Important")
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.toDoStorage.toDos.append(ToDoItem(title: toDoTitle, important: important))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(toDoTitle.isEmpty)
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}
