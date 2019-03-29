//
//  Sort.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Sort: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let unsorted = "unsorted"
    static let sorted = "sorted"
    static let empty = "empty"
  }

  // MARK: Properties
  public var unsorted: Bool? = false
  public var sorted: Bool? = false
  public var empty: Bool? = false

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
    unsorted <- map[SerializationKeys.unsorted]
    sorted <- map[SerializationKeys.sorted]
    empty <- map[SerializationKeys.empty]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.unsorted] = unsorted
    dictionary[SerializationKeys.sorted] = sorted
    dictionary[SerializationKeys.empty] = empty
    return dictionary
  }

}
