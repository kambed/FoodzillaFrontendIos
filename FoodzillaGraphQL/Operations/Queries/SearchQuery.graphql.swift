// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class SearchQuery: GraphQLQuery {
    public static let operationName: String = "search"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query search($pageSize: Int = 2, $currentPage: Int = 1, $phrase: String, $filters: [FilterType]) {
          search(
            input: {phrase: $phrase, pageSize: $pageSize, currentPage: $currentPage, filters: $filters, sort: null}
          ) {
            __typename
            currentPage
            numberOfPages
            opinion
            recipes {
              __typename
              name
            }
          }
        }
        """#
      ))

    public var pageSize: GraphQLNullable<Int>
    public var currentPage: GraphQLNullable<Int>
    public var phrase: GraphQLNullable<String>
    public var filters: GraphQLNullable<[FilterType?]>

    public init(
      pageSize: GraphQLNullable<Int> = 2,
      currentPage: GraphQLNullable<Int> = 1,
      phrase: GraphQLNullable<String>,
      filters: GraphQLNullable<[FilterType?]>
    ) {
      self.pageSize = pageSize
      self.currentPage = currentPage
      self.phrase = phrase
      self.filters = filters
    }

    public var __variables: Variables? { [
      "pageSize": pageSize,
      "currentPage": currentPage,
      "phrase": phrase,
      "filters": filters
    ] }

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("search", Search.self, arguments: ["input": [
          "phrase": .variable("phrase"),
          "pageSize": .variable("pageSize"),
          "currentPage": .variable("currentPage"),
          "filters": .variable("filters"),
          "sort": .null
        ]]),
      ] }

      public var search: Search { __data["search"] }

      /// Search
      ///
      /// Parent Type: `SearchResult`
      public struct Search: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.SearchResult }
        public static var __selections: [Apollo.Selection] { [
          .field("currentPage", Int.self),
          .field("numberOfPages", Int.self),
          .field("opinion", String?.self),
          .field("recipes", [Recipe?].self),
        ] }

        public var currentPage: Int { __data["currentPage"] }
        public var numberOfPages: Int { __data["numberOfPages"] }
        public var opinion: String? { __data["opinion"] }
        public var recipes: [Recipe?] { __data["recipes"] }

        /// Search.Recipe
        ///
        /// Parent Type: `RecipeSummarization`
        public struct Recipe: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.RecipeSummarization }
          public static var __selections: [Apollo.Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }

}