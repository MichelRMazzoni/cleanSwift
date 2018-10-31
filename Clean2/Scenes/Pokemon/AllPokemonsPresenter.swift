//
//  AllPokemonsPresenter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol AllPokemonsPresentationLogic {
    func successGetPokemons(response: AllPokemons.List.Response.Success)
    func failureGetPokemons(response: AllPokemons.List.Response.Failure)
}

class AllPokemonsPresenter: AllPokemonsPresentationLogic {

    // Var's
    weak var viewController: AllPokemonsDisplayLogic?
    
    func successGetPokemons(response: AllPokemons.List.Response.Success) {
        let pokemons = response.pokemonList.compactMap {
            AllPokemons.List.ViewModel.PokemonsDisplay(
                name: $0.name,
                url: $0.url
            )
        }
        
        let vm = AllPokemons.List.ViewModel.Success(items: pokemons)
        viewController?.successGetPokemons(response: vm)
    
    }
    
    func failureGetPokemons(response: AllPokemons.List.Response.Failure) {
        
    }

}
