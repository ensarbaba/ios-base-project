//
//  ServerResponse.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class ServerResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "content"
    static let pageable = "pageable"
    static let totalPages = "totalPages"
    static let empty = "empty"
    static let sort = "sort"
    static let number = "number"
    static let size = "size"
    static let numberOfElements = "numberOfElements"
    static let totalElements = "totalElements"
    static let first = "first"
    static let last = "last"
  }

  // MARK: Properties
  public var content: [Content]?
  public var pageable: Pageable?
  public var totalPages: Int?
  public var empty: Bool? = false
  public var sort: Sort?
  public var number: Int?
  public var size: Int?
  public var numberOfElements: Int?
  public var totalElements: Int?
  public var first: Bool? = false
  public var last: Bool? = false

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
    content <- map[SerializationKeys.content]
    pageable <- map[SerializationKeys.pageable]
    totalPages <- map[SerializationKeys.totalPages]
    empty <- map[SerializationKeys.empty]
    sort <- map[SerializationKeys.sort]
    number <- map[SerializationKeys.number]
    size <- map[SerializationKeys.size]
    numberOfElements <- map[SerializationKeys.numberOfElements]
    totalElements <- map[SerializationKeys.totalElements]
    first <- map[SerializationKeys.first]
    last <- map[SerializationKeys.last]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.map { $0.dictionaryRepresentation() } }
    if let value = pageable { dictionary[SerializationKeys.pageable] = value.dictionaryRepresentation() }
    if let value = totalPages { dictionary[SerializationKeys.totalPages] = value }
    dictionary[SerializationKeys.empty] = empty
    if let value = sort { dictionary[SerializationKeys.sort] = value.dictionaryRepresentation() }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = size { dictionary[SerializationKeys.size] = value }
    if let value = numberOfElements { dictionary[SerializationKeys.numberOfElements] = value }
    if let value = totalElements { dictionary[SerializationKeys.totalElements] = value }
    dictionary[SerializationKeys.first] = first
    dictionary[SerializationKeys.last] = last
    return dictionary
  }

}
