//
//  Status.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Status: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let legacyValue = "legacyValue"
    static let statusValue = "statusValue"
  }

  // MARK: Properties
  public var id: Int?
  public var legacyValue: String?
  public var statusValue: String?

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
    legacyValue <- map[SerializationKeys.legacyValue]
    statusValue <- map[SerializationKeys.statusValue]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = legacyValue { dictionary[SerializationKeys.legacyValue] = value }
    if let value = statusValue { dictionary[SerializationKeys.statusValue] = value }
    return dictionary
  }

}
