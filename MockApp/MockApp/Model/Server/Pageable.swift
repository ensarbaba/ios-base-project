//
//  Pageable.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Pageable: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let offset = "offset"
    static let pageSize = "pageSize"
    static let pageNumber = "pageNumber"
    static let paged = "paged"
    static let unpaged = "unpaged"
    static let sort = "sort"
  }

  // MARK: Properties
  public var offset: Int?
  public var pageSize: Int?
  public var pageNumber: Int?
  public var paged: Bool? = false
  public var unpaged: Bool? = false
  public var sort: Sort?

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
    offset <- map[SerializationKeys.offset]
    pageSize <- map[SerializationKeys.pageSize]
    pageNumber <- map[SerializationKeys.pageNumber]
    paged <- map[SerializationKeys.paged]
    unpaged <- map[SerializationKeys.unpaged]
    sort <- map[SerializationKeys.sort]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = offset { dictionary[SerializationKeys.offset] = value }
    if let value = pageSize { dictionary[SerializationKeys.pageSize] = value }
    if let value = pageNumber { dictionary[SerializationKeys.pageNumber] = value }
    dictionary[SerializationKeys.paged] = paged
    dictionary[SerializationKeys.unpaged] = unpaged
    if let value = sort { dictionary[SerializationKeys.sort] = value.dictionaryRepresentation() }
    return dictionary
  }

}
