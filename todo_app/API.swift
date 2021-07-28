// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AddNotCompletedMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddNotCompleted($title: String!) {
      createTodo(title: $title) {
        __typename
        ... on Todo {
          ...ToDoDetail
        }
      }
    }
    """

  public let operationName: String = "AddNotCompleted"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ToDoDetail.fragmentDefinition)
    return document
  }

  public var title: String

  public init(title: String) {
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createTodo", arguments: ["title": GraphQLVariable("title")], type: .nonNull(.object(CreateTodo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createTodo: CreateTodo) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createTodo": createTodo.resultMap])
    }

    public var createTodo: CreateTodo {
      get {
        return CreateTodo(unsafeResultMap: resultMap["createTodo"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createTodo")
      }
    }

    public struct CreateTodo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Todo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ToDoDetail.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, title: String) {
        self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var toDoDetail: ToDoDetail {
          get {
            return ToDoDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UpdateTitleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateTitle($id: UUID!, $title: String!) {
      updateTodo(id: $id, title: $title)
    }
    """

  public let operationName: String = "UpdateTitle"

  public var id: String
  public var title: String

  public init(id: String, title: String) {
    self.id = id
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateTodo", arguments: ["id": GraphQLVariable("id"), "title": GraphQLVariable("title")], type: .nonNull(.scalar(Bool.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateTodo: Bool) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateTodo": updateTodo])
    }

    public var updateTodo: Bool {
      get {
        return resultMap["updateTodo"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "updateTodo")
      }
    }
  }
}

public final class AllToDosQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query allToDos {
      todos {
        __typename
        ... on Todo {
          ...ToDoDetail
        }
      }
    }
    """

  public let operationName: String = "allToDos"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ToDoDetail.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("todos", type: .nonNull(.list(.nonNull(.object(Todo.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(todos: [Todo]) {
      self.init(unsafeResultMap: ["__typename": "Query", "todos": todos.map { (value: Todo) -> ResultMap in value.resultMap }])
    }

    public var todos: [Todo] {
      get {
        return (resultMap["todos"] as! [ResultMap]).map { (value: ResultMap) -> Todo in Todo(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Todo) -> ResultMap in value.resultMap }, forKey: "todos")
      }
    }

    public struct Todo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Todo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ToDoDetail.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, title: String) {
        self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var toDoDetail: ToDoDetail {
          get {
            return ToDoDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ToDoDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ToDoDetail on Todo {
      __typename
      id
      title
    }
    """

  public static let possibleTypes: [String] = ["Todo"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .scalar(String.self)),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String? = nil, title: String) {
    self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String? {
    get {
      return resultMap["id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }
}
