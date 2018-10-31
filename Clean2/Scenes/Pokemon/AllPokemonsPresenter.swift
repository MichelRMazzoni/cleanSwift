//
//  AllPokemonsPresenter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol AllPokemonsPresentationLogic {
    func successGetPokemons(response: AllPokemons.GetAllPokemons.Response.Success)
    func failureGetPokemons(response: AllPokemons.GetAllPokemons.Response.Failure)
}

class AllPokemonsPresenter: AllPokemonsPresentationLogic {

    // Var's
    weak var viewController: AllPokemonsDisplayLogic?
    
    func successGetPokemons(response: AllPokemons.GetAllPokemons.Response.Success) {
        let pokemons = response.pokemonList.compactMap {
            AllPokemons.GetAllPokemons.ViewModel.PokemonsDisplay(
                name: $0.name,
                url: $0.url
            )
        }
        
        let vm = AllPokemons.GetAllPokemons.ViewModel.Success(items: pokemons)
        viewController?.successGetPokemons(response: vm)
    
    }
    
    func failureGetPokemons(response: AllPokemons.GetAllPokemons.Response.Failure) {
        let vm = AllPokemons.GetAllPokemons.ViewModel.Failure(message: response.error.localizedDescription)
        self.viewController?.failureGetPokemons(response: vm)
    }

}
