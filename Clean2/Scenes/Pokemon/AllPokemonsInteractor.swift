//
//  AllPokemonsInteractor.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import PromiseKit

protocol AllPokemonsBusinessLogic {
    func getPokemons(request: AllPokemons.List.Request)
}

protocol AllPokemonsDataStore {
    var pokemon: [Pokemon] { get }
}

class AllPokemonsInteractor: AllPokemonsBusinessLogic, AllPokemonsDataStore {

    // Var's
    var presenter: AllPokemonsPresentationLogic?
    let worker = AllPokemonsWorker()
    
    var pokemon = [Pokemon]()

    func getPokemons(request: AllPokemons.List.Request) {        
        worker.getList()
            .done { result in
                self.pokemon = result
                let response = AllPokemons.List.Response.Success(pokemonList: result)
                self.presenter?.successGetPokemons(response: response)
            }
            .catch { [weak self] (error) in
                let response = AllPokemons.List.Response.Failure(error: error)
                self?.presenter?.failureGetPokemons(response: response)
        }
    }
    
    
    
}
