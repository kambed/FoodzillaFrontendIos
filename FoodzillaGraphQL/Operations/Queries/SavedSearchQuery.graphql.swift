// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class SavedSearchQuery: GraphQLQuery {
    public static let operationName: String = "savedSearch"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query savedSearch {
          savedSearch {
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

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("savedSearch", [SavedSearch?]?.self),
      ] }

      public var savedSearch: [SavedSearch?]? { __data["savedSearch"] }

      /// SavedSearch
      ///
      /// Parent Type: `SavedSearchResult`
      public struct SavedSearch: FoodzillaGraphQL.SelectionSet {
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

        /// SavedSearch.Filter
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

        /// SavedSearch.Sort
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