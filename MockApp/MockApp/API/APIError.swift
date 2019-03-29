//
//  APIError.swift
//  MockApp
//
//  Created by M. Ensar Baba on 26.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case serialization( message: String )
    case network(internal: Error)
    case service( errorModel: ErrorModel )
    case custom( message: String )
}
