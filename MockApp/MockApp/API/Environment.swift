//
//  Environment.swift
//  MockApp
//
//  Created by M. Ensar Baba on 26.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import Foundation

enum Environment {
    case stable
    case production
    case preproduction
    case test
    
    var path: String {
        switch self {
        case .stable:
            return "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        case .production:
            return "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        case .preproduction:
            return "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        case .test:
            return "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        }
    }
}
