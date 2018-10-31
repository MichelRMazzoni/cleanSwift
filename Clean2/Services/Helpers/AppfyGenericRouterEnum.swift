//
//  AppfyGenericRouterEnum.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation
import Alamofire

protocol AppfyGenericRouterEnum: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var body: Parameters? { get }
}

extension AppfyGenericRouterEnum {
    
    func asURLRequest() throws -> URLRequest {
        let url = try (Webservice.baseDomain + Webservice.apiEndpoint).asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let param = parameters {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
        }
        
        if let safeBody = body {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: safeBody, options: [])
        }
        
        return urlRequest
    }
    
}
