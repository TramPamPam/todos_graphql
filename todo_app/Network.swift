//
//  Network.swift
//  todo_app
//
//  Created by Oleksandr on 23.05.2021.
//

import Foundation
import Apollo
import Combine
import ApolloWebSocket

// MARK: - Singleton Wrapper
var cancellables: Set<AnyCancellable> = []

class Network {
    static let shared = Network()

    private init() {}

    let url = URL(string: backend)!

    private(set) lazy var client = ApolloClient(url: url)

    var listen: Apollo.Cancellable?

    func addNew(title: String) -> Future<ToDoDetail, Error> {
        Future() { promise in
            self.client.perform(mutation: AddNotCompletedMutation(title: title)) { (result) in
                switch result {
                case .success(let graph):
                    print(#function, "success")
                    if let created = graph.data?.createTodo.fragments.toDoDetail {
                        return promise(.success(created))
                    }
                    return promise(.failure(CustomError.unexpected))
                case .failure(let error):
                    print(#function, "failed \(error)")
                    return promise(.failure(error))
                }
            }
        }
    }

    func getAll() -> Future<[ToDoDetail], Error> {
        Future() { promise in
            print(#function)
            self.client.fetch(query: AllToDosQuery()) { (result) in
                switch result {
                case .success(let graph):
                    let todos = graph.data?.todos
                        .compactMap{ $0.fragments.toDoDetail } ?? []
                    print(#function, "success \(todos.count)")

                    return promise(.success(todos))

                case .failure(let error):
                    print(error)
                    return promise(.failure(error))
                }
            }
        }
    }

    func update(details: ToDoDetail, title: String) -> Future<Bool, Error>  {
        Future() { promise in
            self.client.perform(mutation: UpdateTitleMutation(id: details.id!, title: title)) {
                (result) in
                switch (result) {
                case .success(let graph):
                    if let res = graph.data?.updateTodo {
                        return promise(.success(res))
                    }
                    return promise(.failure(CustomError.unexpected))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }
    }

}
enum CustomError: Error {
    case unexpected
}
