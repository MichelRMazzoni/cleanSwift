//
//  WebService+Pokemon.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

extension Webservice {
    
    enum AuthRouter: AppfyGenericRouterEnum {

        case myProfile
        
        var method: HTTPMethod {
            switch self {
            case .myProfile:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .myProfile:
                return "pokemon/"
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .myProfile:
                return nil
            }
        }
        
        var body: Parameters? {
            switch self {
            case .myProfile:
                return nil
            }
        }
        
    }
}

extension Webservice {
    
    enum GetAllPokemons { }
    
}

extension Webservice.GetAllPokemons {
    
    static func getAllPokemons() -> Promise<[Pokemon]> {
        return Promise.init { seal in
            
            let request = Webservice.AuthRouter.myProfile
            
            Webservice.request(request, completion: { (response) in
                guard let statusCode = response.response?.statusCode else {
                    let error = NSError(domain: "Pokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter status da resposta com o servidor"])
                    seal.reject(error)
                    return
                }
                
                switch statusCode {
                case 200, 201:
                    do {
                        let parsedResult = try
                            CodableParser<GetPokemons>.parse(dict: response.result.value)
                        
                        seal.fulfill(parsedResult.results)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 400:
                    let json = JSON(response.result.value ?? [:])
                    let errors = json.dictionary?.compactMap({ (key, value) -> NSError? in
                        let message = value.arrayValue.map({ $0.stringValue }).joined(separator: ", ")
                        return NSError(domain: "Pokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: "\(key.capitalized): \(message)"])
                    })
                    seal.reject(errors?.first ?? NSError(domain: "", code: -1, userInfo: [:]))
                default:
                    let error = NSError(domain: "Pokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: response.error?.localizedDescription ?? ""])
                    seal.reject(error)
                }
            })
        }
    }
}
