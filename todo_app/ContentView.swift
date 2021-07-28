//
//  ContentView.swift
//  todo_app
//
//  Created by Oleksandr on 23.05.2021.
//

import SwiftUI

extension ToDoDetail: Identifiable, Hashable {
    // Equatable
    public static func == (lhs: ToDoDetail, rhs: ToDoDetail) -> Bool {
        return lhs.id == rhs.id
    }

    // Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}
struct EditView: View {
    let network = Network.shared

    @Environment(\.presentationMode) var presentationMode
    @State private var text = ""

    var row: ToDoDetail

    var body: some View {
        HStack {
            TextField(
                row.title,
                text: $text
            ).disableAutocorrection(true)
            .padding()

            Button(action: {

                network.update(details: row, title: text).sink { (completion) in
                    print("completed \(completion)")
                } receiveValue: { (value) in
                    print("received update", value)
                }.store(in: &cancellables)
            }) {
                Image(systemName: "pencil.and.outline")
            }.padding()
        }
    }
}

struct ContentView: View {

    @State var rows: [ToDoDetail] = []
    @State private var showAlert = false
    @State private var showsEdit = false

    let network = Network.shared


    var body: some View {
        NavigationView {
            List(rows) { row in
                NavigationLink(destination: EditView(row: row)) {
                    ToDoRowView(todoItem: row)
                }
            }
            .padding()
            .navigationTitle("ToDos:")
            .navigationBarItems(
                leading:
                    Button(action: {
                        network.getAll().sink { (completion) in
                            print("completed \(completion)")
                        } receiveValue: { (value) in
                            print("received ", value.count)
                            rows = value
                        }.store(in: &cancellables)

                    }) {
                        Image(systemName: "icloud.and.arrow.down")
                    },

                trailing:
                    Button(action: {
                        showAlert = true
                    }) {
                        Image(systemName: "pencil")
                    }.sheet(isPresented: $showAlert) {
                        CreateView() {
                            showAlert = false
                        }
                    }
            )
        }
        .onAppear(perform: {
            network.getAll().sink { (completion) in
                print("completed \(completion)")
            } receiveValue: { (value) in
                print("received ", value.count)
                rows = value
            }.store(in: &cancellables)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
