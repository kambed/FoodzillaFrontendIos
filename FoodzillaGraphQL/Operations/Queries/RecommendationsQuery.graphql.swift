// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class RecommendationsQuery: GraphQLQuery {
    public static let operationName: String = "recommendations"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query recommendations {
          recommendations {
            __typename
            opinion
            recipes {
              __typename
              id
              name
              image
              timeOfPreparation
            }
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
        .field("recommendations", Recommendations.self),
      ] }

      public var recommendations: Recommendations { __data["recommendations"] }

      /// Recommendations
      ///
      /// Parent Type: `Recommendations`
      public struct Recommendations: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Recommendations }
        public static var __selections: [Apollo.Selection] { [
          .field("opinion", String?.self),
          .field("recipes", [Recipe?].self),
        ] }

        public var opinion: String? { __data["opinion"] }
        public var recipes: [Recipe?] { __data["recipes"] }

        /// Recommendations.Recipe
        ///
        /// Parent Type: `Recipe`
        public struct Recipe: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Recipe }
          public static var __selections: [Apollo.Selection] { [
            .field("id", FoodzillaGraphQL.ID?.self),
            .field("name", String.self),
            .field("image", String?.self),
            .field("timeOfPreparation", Int?.self),
          ] }

          public var id: FoodzillaGraphQL.ID? { __data["id"] }
          public var name: String { __data["name"] }
          public var image: String? { __data["image"] }
          public var timeOfPreparation: Int? { __data["timeOfPreparation"] }
        }
      }
    }
  }

}