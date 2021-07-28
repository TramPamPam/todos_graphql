//
//  CreateView.swift
//  todo_app
//
//  Created by Oleksandr on 23.05.2021.
//

import SwiftUI

struct CreateView: View {
    let network = Network.shared

    @Environment(\.presentationMode) var presentationMode
    @State private var text = ""

    var completion: () -> Void

    var body: some View {
        HStack {
            TextField(
                "Enter a note",
                text: $text
            ).disableAutocorrection(true)
            .padding()

            Button(action: {

                network.addNew(title: text).sink { (completion) in
                    print("completed \(completion)")
                } receiveValue: { (value) in
                    print("received ", value)
                    completion()
                }.store(in: &cancellables)
            }) {
                Image(systemName: "icloud.and.arrow.up")
            }.padding()
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView {

        }
    }
}
