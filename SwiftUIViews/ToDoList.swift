//
//  ContentView.swift
//  test3
//
//  Created by Emilio Nicoli on 12/5/20.
//

import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var toDoStorage: ToDoStorage
    var body: some View {
        NavigationView {
            List {
                ForEach (self.toDoStorage.toDos) { todo in
                    if todo.important {
                        Text(todo.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(2)
                            .background(Rectangle()
                                            .foregroundColor(.red)
                                            .cornerRadius(5))
                        
                    } else {
                        Text(todo.title)
                    }
                    
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        self.toDoStorage.toDos.remove(at: index)
                    }
                })
            }.navigationBarTitle(Text("To Dos"))
            .navigationBarItems(trailing: NavigationLink(destination: CreateToDo(),
                                                                        label: {
                                                                            Text("Add")
                                                                        }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToDoList().environmentObject(ToDoStorage())
        }
    }
}
