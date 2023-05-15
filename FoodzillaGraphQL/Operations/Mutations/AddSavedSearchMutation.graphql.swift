// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class AddSavedSearchMutation: GraphQLMutation {
    public static let operationName: String = "addSavedSearch"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        mutation addSavedSearch {
          addSavedSearch(
            input: {phrase: "search phrase", filters: [{attribute: "name", equals: "abc"}, {attribute: "asdasd", equals: "eeeeeeee"}], sort: [{attribute: "name", direction: ASC}]}
          ) {
            __typename
            id
            phrase
            filters {
              __typename
              attribute
              equals
            }
            sort {
              __typename
              attribute
              direction
            }
          }
        }
        """#
      ))

    public init() {}

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Mutation }
      public static var __selections: [Apollo.Selection] { [
        .field("addSavedSearch", AddSavedSearch.self, arguments: ["input": [
          "phrase": "search phrase",
          "filters": [[
            "attribute": "name",
            "equals": "abc"
          ], [
            "attribute": "asdasd",
            "equals": "eeeeeeee"
          ]],
          "sort": [[
            "attribute": "name",
            "direction": "ASC"
          ]]
        ]]),
      ] }

      public var addSavedSearch: AddSavedSearch { __data["addSavedSearch"] }

      /// AddSavedSearch
      ///
      /// Parent Type: `SavedSearchResult`
      public struct AddSavedSearch: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.SavedSearchResult }
        public static var __selections: [Apollo.Selection] { [
          .field("id", Int?.self),
          .field("phrase", String?.self),
          .field("filters", [Filter?]?.self),
          .field("sort", [Sort?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var phrase: String? { __data["phrase"] }
        public var filters: [Filter?]? { __data["filters"] }
        public var sort: [Sort?]? { __data["sort"] }

        /// AddSavedSearch.Filter
        ///
        /// Parent Type: `FilterTypeResult`
        public struct Filter: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.FilterTypeResult }
          public static var __selections: [Apollo.Selection] { [
            .field("attribute", String.self),
            .field("equals", String?.self),
          ] }

          public var attribute: String { __data["attribute"] }
          public var equals: String? { __data["equals"] }
        }

        /// AddSavedSearch.Sort
        ///
        /// Parent Type: `SavedSearchSortType`
        public struct Sort: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.SavedSearchSortType }
          public static var __selections: [Apollo.Selection] { [
            .field("attribute", String?.self),
            .field("direction", GraphQLEnum<FoodzillaGraphQL.SortDirection>?.self),
          ] }

          public var attribute: String? { __data["attribute"] }
          public var direction: GraphQLEnum<FoodzillaGraphQL.SortDirection>? { __data["direction"] }
        }
      }
    }
  }

}