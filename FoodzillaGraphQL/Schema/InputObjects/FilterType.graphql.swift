// @generated
// This file was automatically generated and should not be edited.

import Apollo

public extension FoodzillaGraphQL {
  struct FilterType: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      attribute: String,
      equals: GraphQLNullable<String> = nil,
      from: GraphQLNullable<Int> = nil,
      to: GraphQLNullable<Int> = nil,
      `in`: GraphQLNullable<[String?]> = nil,
      hasOnly: GraphQLNullable<[String?]> = nil
    ) {
      __data = InputDict([
        "attribute": attribute,
        "equals": equals,
        "from": from,
        "to": to,
        "in": `in`,
        "hasOnly": hasOnly
      ])
    }

    public var attribute: String {
      get { __data["attribute"] }
      set { __data["attribute"] = newValue }
    }

    public var equals: GraphQLNullable<String> {
      get { __data["equals"] }
      set { __data["equals"] = newValue }
    }

    public var from: GraphQLNullable<Int> {
      get { __data["from"] }
      set { __data["from"] = newValue }
    }

    public var to: GraphQLNullable<Int> {
      get { __data["to"] }
      set { __data["to"] = newValue }
    }

    public var `in`: GraphQLNullable<[String?]> {
      get { __data["in"] }
      set { __data["in"] = newValue }
    }

    public var hasOnly: GraphQLNullable<[String?]> {
      get { __data["hasOnly"] }
      set { __data["hasOnly"] = newValue }
    }
  }

}