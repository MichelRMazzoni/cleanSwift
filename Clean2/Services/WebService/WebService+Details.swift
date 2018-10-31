//
//  WebService+Details.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

extension Webservice {
    
    enum DetailsPokemon: AppfyGenericRouterEnum {
        
        case details(indexPokemon: Int)
        
        var method: HTTPMethod {
            switch self {
            case .details( _):
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .details(let indexPokemon):
                return "pokemon/\(indexPokemon)/"
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .details( _):
                return nil
            }
        }
        
        var body: Parameters? {
            switch self {
            case .details( _):
                return nil
            }
        }
        
    }
}

extension Webservice {
    
    enum GetDetails { }
    
}

extension Webservice.GetDetails {
    
    static func getDetails(indexPokemon: Int) -> Promise<DetailsPokemon> {
        return Promise.init { seal in
            
            let request = Webservice.DetailsPokemon.details(indexPokemon: indexPokemon)
            
            Webservice.request(request, completion: { (response) in
                guard let statusCode = response.response?.statusCode else {
                    let error = NSError(domain: "DetailsPokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter status da resposta com o servidor"])
                    seal.reject(error)
                    return
                }
                
                switch statusCode {
                case 200, 201:
                    do {
                        let parsedResult = try
                            CodableParser<DetailsPokemon>.parse(dict: response.result.value)
                        
                        seal.fulfill(parsedResult)
                    }
                    catch let error {
                        seal.reject(error)
                    }
                case 400:
                    let json = JSON(response.result.value ?? [:])
                    let errors = json.dictionary?.compactMap({ (key, value) -> NSError? in
                        let message = value.arrayValue.map({ $0.stringValue }).joined(separator: ", ")
                        return NSError(domain: "DetailsPokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: "\(key.capitalized): \(message)"])
                    })
                    seal.reject(errors?.first ?? NSError(domain: "", code: -1, userInfo: [:]))
                default:
                    let error = NSError(domain: "DetailsPokemon", code: -1, userInfo: [NSLocalizedDescriptionKey: response.error?.localizedDescription ?? ""])
                    seal.reject(error)
                }
            })
        }
    }
}
