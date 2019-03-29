//
//  ServerRequest.swift
//  MockApp
//
//  Created by M. Ensar Baba on 29.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//
import ObjectMapper
import Alamofire

public final class ServerRequest: Request {
    
    typealias Response = ServerResponse
    var endPoint: String = ""
    var httpMethod: HTTPMethod = .get
    
    public init?(map: Map) { }
    public func mapping(map: Map) { }
    
    init() {
    }
}
