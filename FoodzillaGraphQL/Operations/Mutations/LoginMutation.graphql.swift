// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class LoginMutation: GraphQLMutation {
    public static let operationName: String = "login"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        mutation login($username: String!, $password: String!) {
          login(username: $username, password: $password) {
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

    public var username: String
    public var password: String

    public init(
      username: String,
      password: String
    ) {
      self.username = username
      self.password = password
    }

    public var __variables: Variables? { [
      "username": username,
      "password": password
    ] }

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Mutation }
      public static var __selections: [Apollo.Selection] { [
        .field("login", Login?.self, arguments: [
          "username": .variable("username"),
          "password": .variable("password")
        ]),
      ] }

      public var login: Login? { __data["login"] }

      /// Login
      ///
      /// Parent Type: `Token`
      public struct Login: FoodzillaGraphQL.SelectionSet {
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

        /// Login.Customer
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