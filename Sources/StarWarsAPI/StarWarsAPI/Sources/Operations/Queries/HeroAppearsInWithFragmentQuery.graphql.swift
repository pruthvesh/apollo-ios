// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class HeroAppearsInWithFragmentQuery: GraphQLQuery {
  public static let operationName: String = "HeroAppearsInWithFragment"
  public static let document: ApolloAPI.DocumentType = .automaticallyPersisted(
    operationIdentifier: "1756158bd7736d58db45a48d74a724fa1b6fdac735376df8afac8318ba5431fb",
    definition: .init(
      #"""
      query HeroAppearsInWithFragment($episode: Episode) {
        hero(episode: $episode) {
          __typename
          ...CharacterAppearsIn
        }
      }
      """#,
      fragments: [CharacterAppearsIn.self]
    ))

  public var episode: GraphQLNullable<GraphQLEnum<Episode>>

  public init(episode: GraphQLNullable<GraphQLEnum<Episode>>) {
    self.episode = episode
  }

  public var __variables: Variables? { ["episode": episode] }

  public struct Data: StarWarsAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("hero", Hero?.self, arguments: ["episode": .variable("episode")]),
    ] }

    public var hero: Hero? { __data["hero"] }

    public init(
      hero: Hero? = nil
    ) {
      self.init(_dataDict: DataDict(data: [
        "__typename": StarWarsAPI.Objects.Query.typename,
        "hero": hero._fieldData,
        "__fulfilled": Set([
          ObjectIdentifier(Self.self)
        ])
      ]))
    }

    /// Hero
    ///
    /// Parent Type: `Character`
    public struct Hero: StarWarsAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { StarWarsAPI.Interfaces.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CharacterAppearsIn.self),
      ] }

      /// The movies this character appears in
      public var appearsIn: [GraphQLEnum<StarWarsAPI.Episode>?] { __data["appearsIn"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var characterAppearsIn: CharacterAppearsIn { _toFragment() }
      }

      public init(
        __typename: String,
        appearsIn: [GraphQLEnum<StarWarsAPI.Episode>?]
      ) {
        self.init(_dataDict: DataDict(data: [
          "__typename": __typename,
          "appearsIn": appearsIn,
          "__fulfilled": Set([
            ObjectIdentifier(Self.self),
            ObjectIdentifier(CharacterAppearsIn.self)
          ])
        ]))
      }
    }
  }
}
