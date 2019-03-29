//
//  APIClient.swift
//  MockApp
//
//  Created by M. Ensar Baba on 26.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON
import Alamofire

protocol Request: Mappable {
    associatedtype Response: Mappable
    var endPoint: String { get set }
    var httpMethod: HTTPMethod { get set }
}

public class APIClient {
    
    static let instance = APIClient()
    
    // MARK: private
    private let sessionManager: SessionManager
    var environment: Environment?
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 280
        sessionManager = SessionManager( configuration: URLSessionConfiguration.default )
    }
    
    func execute<T: Request>(request: T, success: @escaping (T.Response) -> Void,
                             failure: @escaping (APIError) -> Void, customEndPoint: String? = nil ) {
        
        guard let environment = environment, environment.path.isEmpty == false else {
            Log.di("Environment not configured...")
            return
        }
        
        let parameters = Mapper<T>().toJSON(request)
        var path = environment.path
        
        if let customEndPoint = customEndPoint {
            path += customEndPoint
        } else {
            path += request.endPoint
        }
        //        path+="&apiKey=\(Session.sharedInstance.apiKey)"
        
        sessionManager.request(path, method: request.httpMethod, parameters: parameters.isEmpty ? nil : parameters,
                               encoding: JSONEncoding.default,
                               headers: Session.sharedInstance.getHeaders()).validate().responseJSON { responseObject in
                                
                                if let Authorization = responseObject.response?.allHeaderFields["Authorization"] as? String {
                                    Session.sharedInstance.Authorization = Authorization
                                }
                                switch responseObject.result {
                                case .success(let value):
                                    let json = JSON(value)
                                    guard let result = Mapper<T.Response>().map(JSONObject: json.object) else {
                                        failure( .serialization(message: "Response Serialization Error") )
                                        return
                                    }
                                    success(result)
                                case .failure(let error):
                                    Log.di(error.localizedDescription)
                                    failure( .network(internal: error) )
                                }
        }
    }
    
    func executeWithoutMapping<T: Request>( request: T, success: @escaping (JSON) -> Void,
                                            failure: @escaping (APIError) -> Void, customEndPoint: String? = nil) {
        
        guard let environment = environment, environment.path.isEmpty == false else {
            Log.di("Environment not configured...")
            return
        }
        
        var path = environment.path
        
        if let customEndPoint = customEndPoint {
            path += customEndPoint
        } else {
            path += request.endPoint
        }
        
        let parameters = Mapper<T>().toJSON(request)
        sessionManager.request(path,
                               method: request.httpMethod,
                               parameters: parameters.isEmpty ? nil : parameters,
                               encoding: JSONEncoding.default,
                               headers: Session.sharedInstance.getHeaders()).responseJSON { responseObject in
                                if let Authorization = responseObject.response?.allHeaderFields["Authorization"] as? String {
                                    Session.sharedInstance.Authorization = Authorization
                                }
                                
                                switch responseObject.result {
                                case .success(let value):
                                    let json = JSON(value)
                                    success(json)
                                case .failure(let error):
                                    failure( .network(internal: error) )
                                }
        }
    }
    
    func executeGET( endPoint: String, success: @escaping ( JSON ) -> Void, failure: @escaping (APIError) -> Void ) {
        guard let environment = environment, environment.path.isEmpty == false else {
            Log.di("Environment not configured...")
            return
        }
        
        let path = environment.path+endPoint
        sessionManager.request(path, method: .get, encoding: JSONEncoding.default,
                               headers: Session.sharedInstance.getHeaders()).responseJSON { responseObject in
                                
                                if let Authorization = responseObject.response?.allHeaderFields["Authorization"] as? String {
                                    Session.sharedInstance.Authorization = Authorization
                                }
                                Log.di(responseObject)
                                switch responseObject.result {
                                case .success(let value):
                                    let json = JSON(value)
                                    success(json)
                                case .failure(let error):
                                    failure( .network(internal: error) )
                                }
        }
    }
}
