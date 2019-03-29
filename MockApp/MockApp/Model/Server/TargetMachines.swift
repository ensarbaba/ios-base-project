//
//  TargetMachines.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class TargetMachines: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let targetMachine = "targetMachine"
    static let sourceMachineId = "sourceMachineId"
    static let circuitStatusId = "circuitStatusId"
  }

  // MARK: Properties
  public var id: Int?
  public var targetMachine: TargetMachine?
  public var sourceMachineId: Int?
  public var circuitStatusId: Int?

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
    targetMachine <- map[SerializationKeys.targetMachine]
    sourceMachineId <- map[SerializationKeys.sourceMachineId]
    circuitStatusId <- map[SerializationKeys.circuitStatusId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = targetMachine { dictionary[SerializationKeys.targetMachine] = value.dictionaryRepresentation() }
    if let value = sourceMachineId { dictionary[SerializationKeys.sourceMachineId] = value }
    if let value = circuitStatusId { dictionary[SerializationKeys.circuitStatusId] = value }
    return dictionary
  }

}
