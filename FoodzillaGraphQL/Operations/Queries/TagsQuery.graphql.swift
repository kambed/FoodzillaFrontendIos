// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class TagsQuery: GraphQLQuery {
    public static let operationName: String = "tags"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query tags {
          tags {
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
        .field("tags", [Tag?]?.self),
      ] }

      public var tags: [Tag?]? { __data["tags"] }

      /// Tag
      ///
      /// Parent Type: `Tag`
      public struct Tag: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Tag }
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