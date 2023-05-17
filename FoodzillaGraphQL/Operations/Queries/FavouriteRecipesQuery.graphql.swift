// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class FavouriteRecipesQuery: GraphQLQuery {
    public static let operationName: String = "favouriteRecipes"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query favouriteRecipes {
          favouriteRecipes {
            __typename
            id
            name
            timeOfPreparation
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
        .field("favouriteRecipes", [FavouriteRecipe?]?.self),
      ] }

      public var favouriteRecipes: [FavouriteRecipe?]? { __data["favouriteRecipes"] }

      /// FavouriteRecipe
      ///
      /// Parent Type: `RecipeSummarization`
      public struct FavouriteRecipe: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.RecipeSummarization }
        public static var __selections: [Apollo.Selection] { [
          .field("id", FoodzillaGraphQL.ID?.self),
          .field("name", String.self),
          .field("timeOfPreparation", Int?.self),
        ] }

        public var id: FoodzillaGraphQL.ID? { __data["id"] }
        public var name: String { __data["name"] }
        public var timeOfPreparation: Int? { __data["timeOfPreparation"] }
      }
    }
  }

}