// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class GetRecommendationsQuery: GraphQLQuery {
    public static let operationName: String = "GetRecommendations"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetRecommendations {
          recommendations {
            __typename
            id
            name
            timeOfPreparation
            image
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
        .field("recommendations", [Recommendation?].self),
      ] }

      public var recommendations: [Recommendation?] { __data["recommendations"] }

      /// Recommendation
      ///
      /// Parent Type: `RecipeSummarization`
      public struct Recommendation: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.RecipeSummarization }
        public static var __selections: [Apollo.Selection] { [
          .field("id", FoodzillaGraphQL.ID?.self),
          .field("name", String.self),
          .field("timeOfPreparation", Int?.self),
          .field("image", String?.self),
        ] }

        public var id: FoodzillaGraphQL.ID? { __data["id"] }
        public var name: String { __data["name"] }
        public var timeOfPreparation: Int? { __data["timeOfPreparation"] }
        public var image: String? { __data["image"] }
      }
    }
  }

}