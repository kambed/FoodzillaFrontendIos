// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension FoodzillaGraphQL {
  class EditMutation: GraphQLMutation {
    public static let operationName: String = "edit"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        mutation edit($firstname: String!, $lastname: String!, $username: String!, $password: String!) {
          editCustomer(
            customer: {firstname: $firstname, lastname: $lastname, username: $username, password: $password}
          ) {
            __typename
            firstname
            lastname
            username
          }
        }
        """#
      ))

    public var firstname: String
    public var lastname: String
    public var username: String
    public var password: String

    public init(
      firstname: String,
      lastname: String,
      username: String,
      password: String
    ) {
      self.firstname = firstname
      self.lastname = lastname
      self.username = username
      self.password = password
    }

    public var __variables: Variables? { [
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "password": password
    ] }

    public struct Data: FoodzillaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: Apollo.ParentType { FoodzillaGraphQL.Objects.Mutation }
      public static var __selections: [Apollo.Selection] { [
        .field("editCustomer", EditCustomer?.self, arguments: ["customer": [
          "firstname": .variable("firstname"),
          "lastname": .variable("lastname"),
          "username": .variable("username"),
          "password": .variable("password")
        ]]),
      ] }

      public var editCustomer: EditCustomer? { __data["editCustomer"] }

      /// EditCustomer
      ///
      /// Parent Type: `Customer`
      public struct EditCustomer: FoodzillaGraphQL.SelectionSet {
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