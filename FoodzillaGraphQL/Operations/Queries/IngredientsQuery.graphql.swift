// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class IngredientsQuery: GraphQLQuery {
    public static let operationName: String = "ingredients"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query ingredients {
          ingredients {
            __typename
            id
            name
          }
        }
        """#
      ))

    public init() {}

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("ingredients", [Ingredient?]?.self),
      ] }

      public var ingredients: [Ingredient?]? { __data["ingredients"] }

      /// Ingredient
      ///
      /// Parent Type: `Ingredient`
      public struct Ingredient: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Ingredient }
        public static var __selections: [Apollo.Selection] { [
          .field("id", FoodzillaGraphQL.ID?.self),
          .field("name", String.self),
        ] }

        public var id: FoodzillaGraphQL.ID? { __data["id"] }
        public var name: String { __data["name"] }
      }
    }
  }

}