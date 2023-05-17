// @generated
// This file was automatically generated and should not be edited.

import Apollo

public protocol FoodzillaGraphQL_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == FoodzillaGraphQL.SchemaMetadata {}

public protocol FoodzillaGraphQL_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == FoodzillaGraphQL.SchemaMetadata {}

public protocol FoodzillaGraphQL_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == FoodzillaGraphQL.SchemaMetadata {}

public protocol FoodzillaGraphQL_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == FoodzillaGraphQL.SchemaMetadata {}

public extension FoodzillaGraphQL {
  typealias ID = String

  typealias SelectionSet = FoodzillaGraphQL_SelectionSet

  typealias InlineFragment = FoodzillaGraphQL_InlineFragment

  typealias MutableSelectionSet = FoodzillaGraphQL_MutableSelectionSet

  typealias MutableInlineFragment = FoodzillaGraphQL_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    public static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return FoodzillaGraphQL.Objects.Query
      case "RecipeSummarization": return FoodzillaGraphQL.Objects.RecipeSummarization
      case "Ingredient": return FoodzillaGraphQL.Objects.Ingredient
      case "Mutation": return FoodzillaGraphQL.Objects.Mutation
      case "Token": return FoodzillaGraphQL.Objects.Token
      case "Customer": return FoodzillaGraphQL.Objects.Customer
      case "Tag": return FoodzillaGraphQL.Objects.Tag
      case "SavedSearchResult": return FoodzillaGraphQL.Objects.SavedSearchResult
      case "FilterTypeResult": return FoodzillaGraphQL.Objects.FilterTypeResult
      case "SavedSearchSortType": return FoodzillaGraphQL.Objects.SavedSearchSortType
      case "Recipe": return FoodzillaGraphQL.Objects.Recipe
      case "Review": return FoodzillaGraphQL.Objects.Review
      case "SearchResult": return FoodzillaGraphQL.Objects.SearchResult
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}