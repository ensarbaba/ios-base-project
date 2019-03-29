//
//  Session.swift
//  MockApp
//
//  Created by M. Ensar Baba on 26.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import Foundation

class Session {
    
    var Authorization: String? = ""
    
    func getHeaders() -> [String: String] {
        let headers = [
            "Authorization": ""+self.Authorization!+"",
            "Content-Type": "application/json"
        ]
        
        return headers
    }
    
    init() {
        
    }
    
    public class var sharedInstance: Session {
        struct Singleton {
            static let instance: Session = Session()
        }
        return Singleton.instance
    }
    
}
