//
//  CommunicationProtocols.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class CommunicationProtocols: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let name = "name"
    static let defaultPort = "defaultPort"
  }

  // MARK: Properties
  public var id: Int?
  public var name: String?
  public var defaultPort: Int?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map) {

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    id <- map[SerializationKeys.id]
    name <- map[SerializationKeys.name]
    defaultPort <- map[SerializationKeys.defaultPort]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = defaultPort { dictionary[SerializationKeys.defaultPort] = value }
    return dictionary
  }

}
