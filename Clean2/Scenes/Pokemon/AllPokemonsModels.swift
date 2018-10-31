//
//  AllPokemonsModels.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

enum AllPokemons {

    enum GetAllPokemons {
        struct Request {
            
        }
        
        struct Response {
            struct Success {
                let pokemonList: [Pokemon]
            }
            
            struct Failure {
                let error: Error
            }
        }
        
        struct ViewModel {
            
            struct PokemonsDisplay {
                let name: String
                let url: String
            }
            
            struct Success {
                let items: [PokemonsDisplay]
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
}
