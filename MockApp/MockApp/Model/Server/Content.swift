//
//  Content.swift
//
//  Created by M. Ensar Baba on 29.03.2019
//  Copyright (c) MobileNOC. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Content: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let serialNumber = "serialNumber"
    static let locationId = "locationId"
    static let serialNum = "serialNum"
    static let model = "model"
    static let type = "type"
    static let communicationProtocols = "communicationProtocols"
    static let status = "status"
    static let ipAddress = "ipAddress"
    static let location = "location"
    static let id = "id"
    static let targetMachines = "targetMachines"
    static let version = "version"
    static let ipSubnetMask = "ipSubnetMask"
  }

  // MARK: Properties
  public var name: String?
  public var serialNumber: String?
  public var locationId: Int?
  public var serialNum: String?
  public var model: Model?
  public var type: Type?
  public var communicationProtocols: [CommunicationProtocols]?
  public var status: Status?
  public var ipAddress: String?
  public var location: Int?
  public var id: Int?
  public var targetMachines: [TargetMachines]?
  public var version: String?
  public var ipSubnetMask: String?

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
    name <- map[SerializationKeys.name]
    serialNumber <- map[SerializationKeys.serialNumber]
    locationId <- map[SerializationKeys.locationId]
    serialNum <- map[SerializationKeys.serialNum]
    model <- map[SerializationKeys.model]
    type <- map[SerializationKeys.type]
    communicationProtocols <- map[SerializationKeys.communicationProtocols]
    status <- map[SerializationKeys.status]
    ipAddress <- map[SerializationKeys.ipAddress]
    location <- map[SerializationKeys.location]
    id <- map[SerializationKeys.id]
    targetMachines <- map[SerializationKeys.targetMachines]
    version <- map[SerializationKeys.version]
    ipSubnetMask <- map[SerializationKeys.ipSubnetMask]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = serialNumber { dictionary[SerializationKeys.serialNumber] = value }
    if let value = locationId { dictionary[SerializationKeys.locationId] = value }
    if let value = serialNum { dictionary[SerializationKeys.serialNum] = value }
    if let value = model { dictionary[SerializationKeys.model] = value.dictionaryRepresentation() }
    if let value = type { dictionary[SerializationKeys.type] = value.dictionaryRepresentation() }
    if let value = communicationProtocols { dictionary[SerializationKeys.communicationProtocols] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[SerializationKeys.status] = value.dictionaryRepresentation() }
    if let value = ipAddress { dictionary[SerializationKeys.ipAddress] = value }
    if let value = location { dictionary[SerializationKeys.location] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = targetMachines { dictionary[SerializationKeys.targetMachines] = value.map { $0.dictionaryRepresentation() } }
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = ipSubnetMask { dictionary[SerializationKeys.ipSubnetMask] = value }
    return dictionary
  }

}
