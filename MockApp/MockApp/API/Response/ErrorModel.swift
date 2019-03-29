//
//  ErrorModel.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import ObjectMapper

public struct ErrorModel: Mappable {
    public var errorCode: String?
    public var message: String?
    public var messageLevel: String?
    
    public init?(map: Map) { }
    
    mutating public func mapping(map: Map) {
        self.errorCode <- map["errorCode"]
        self.message <- map["message"]
        self.messageLevel <- map["messageLevel"]
    }
    
    public init(message: String) {
        self.message = message
    }
}
