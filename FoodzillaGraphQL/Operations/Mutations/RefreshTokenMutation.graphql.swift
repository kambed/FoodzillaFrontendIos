// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class RefreshTokenMutation: GraphQLMutation {
    public static let operationName: String = "refreshToken"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        mutation refreshToken($refreshToken: String!) {
          refreshToken(refreshToken: $refreshToken) {
            __typename
            token
            refreshToken
            customer {
              __typename
              firstname
              lastname
              username
            }
          }
        }
        """#
      ))

    public var refreshToken: String

    public init(refreshToken: String) {
      self.refreshToken = refreshToken
    }

    public var __variables: Variables? { ["refreshToken": refreshToken] }

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Mutation }
      public static var __selections: [Apollo.Selection] { [
        .field("refreshToken", RefreshToken?.self, arguments: ["refreshToken": .variable("refreshToken")]),
      ] }

      public var refreshToken: RefreshToken? { __data["refreshToken"] }

      /// RefreshToken
      ///
      /// Parent Type: `Token`
      public struct RefreshToken: FoodzillaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Token }
        public static var __selections: [Apollo.Selection] { [
          .field("token", String.self),
          .field("refreshToken", String.self),
          .field("customer", Customer.self),
        ] }

        public var token: String { __data["token"] }
        public var refreshToken: String { __data["refreshToken"] }
        public var customer: Customer { __data["customer"] }

        /// RefreshToken.Customer
        ///
        /// Parent Type: `Customer`
        public struct Customer: FoodzillaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Customer }
          public static var __selections: [Apollo.Selection] { [
            .field("firstname", String.self),
            .field("lastname", String.self),
            .field("username", String.self),
          ] }

          public var firstname: String { __data["firstname"] }
          public var lastname: String { __data["lastname"] }
          public var username: String { __data["username"] }
        }
      }
    }
  }

}