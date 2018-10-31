//
//  WebService.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation
import Alamofire

class Webservice: SessionManager {
    
    // Route base
    static let baseDomain = "https://pokeapi.co/"
    static let apiEndpoint = "api/v2/"
    static let refreshTokenEndpoint = "auth/refresh/"
    static let session = Webservice()
    
    static let acceptableStatusCodes: [Int] = {
        return (200...600).filter({ $0 != 401 })
    }()
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        self.init(configuration: configuration)
        self.adapter = AppfyRequestAdapter()
        self.retrier = AppfyRequestRetrier()
    }
    
    class func request(_ request: AppfyGenericRouterEnum, completion: @escaping (DataResponse<Any>) -> Void) {
        Webservice.session
            .request(request)
            .validate(statusCode: Webservice.acceptableStatusCodes)
            .responseJSON(completionHandler: completion)
    }
    
}
