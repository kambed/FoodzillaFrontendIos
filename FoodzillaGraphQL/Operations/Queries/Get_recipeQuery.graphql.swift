// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class Get_recipeQuery: GraphQLQuery {
    public static let operationName: String = "get_recipe"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query get_recipe($id: ID!) {
          recipe(id: $id) {
            __typename
            id
            name
            description
            timeOfPreparation
            numberOfSteps
            steps
            numberOfIngredients
            calories
            fat
            sugar
            sodium
            protein
            saturatedFat
            carbohydrates
            reviews {
              __typename
              review
              rating
            }
            ingredients {
              __typename
              name
            }
            tags {
              __typename
              name
            }
          }
        }
        """#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("recipe", Recipe?.self, arguments: ["id": .variable("id")]),
      ] }

      public var recipe: Recipe? { __data["recipe"] }

      /// Recipe
      ///
      /// Parent Type: `Recipe`
      public struct Recipe: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Recipe }
        public static var __selections: [Apollo.Selection] { [
          .field("id", FoodzillaGraphQL.ID?.self),
          .field("name", String.self),
          .field("description", String?.self),
          .field("timeOfPreparation", Int?.self),
          .field("numberOfSteps", Int?.self),
          .field("steps", [String?]?.self),
          .field("numberOfIngredients", Int?.self),
          .field("calories", Double?.self),
          .field("fat", Int?.self),
          .field("sugar", Int?.self),
          .field("sodium", Int?.self),
          .field("protein", Int?.self),
          .field("saturatedFat", Int?.self),
          .field("carbohydrates", Int?.self),
          .field("reviews", [Review?]?.self),
          .field("ingredients", [Ingredient?]?.self),
          .field("tags", [Tag?]?.self),
        ] }

        public var id: FoodzillaGraphQL.ID? { __data["id"] }
        public var name: String { __data["name"] }
        public var description: String? { __data["description"] }
        public var timeOfPreparation: Int? { __data["timeOfPreparation"] }
        public var numberOfSteps: Int? { __data["numberOfSteps"] }
        public var steps: [String?]? { __data["steps"] }
        public var numberOfIngredients: Int? { __data["numberOfIngredients"] }
        public var calories: Double? { __data["calories"] }
        public var fat: Int? { __data["fat"] }
        public var sugar: Int? { __data["sugar"] }
        public var sodium: Int? { __data["sodium"] }
        public var protein: Int? { __data["protein"] }
        public var saturatedFat: Int? { __data["saturatedFat"] }
        public var carbohydrates: Int? { __data["carbohydrates"] }
        public var reviews: [Review?]? { __data["reviews"] }
        public var ingredients: [Ingredient?]? { __data["ingredients"] }
        public var tags: [Tag?]? { __data["tags"] }

        /// Recipe.Review
        ///
        /// Parent Type: `Review`
        public struct Review: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Review }
          public static var __selections: [Apollo.Selection] { [
            .field("review", String?.self),
            .field("rating", Int.self),
          ] }

          public var review: String? { __data["review"] }
          public var rating: Int { __data["rating"] }
        }

        /// Recipe.Ingredient
        ///
        /// Parent Type: `Ingredient`
        public struct Ingredient: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Ingredient }
          public static var __selections: [Apollo.Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }

        /// Recipe.Tag
        ///
        /// Parent Type: `Tag`
        public struct Tag: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Tag }
          public static var __selections: [Apollo.Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }

}