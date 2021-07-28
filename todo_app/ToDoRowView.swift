//
//  ToDoRowView.swift
//  todo_app
//
//  Created by Oleksandr on 23.05.2021.
//

import SwiftUI

struct ToDoRowView: View {
    @State var todoItem: ToDoDetail

    var body: some View {
        Text(todoItem.title)
    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRowView(todoItem: .init(id: "1", title: "äbc"))
    }
}
