//
//  AllPokemonsViewController+DisplayLogic.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol AllPokemonsDisplayLogic: class {
    func successGetPokemons(response: AllPokemons.List.ViewModel.Success)
    func failureGetPokemons(response: AllPokemons.List.ViewModel.Failure)
}

extension AllPokemonsViewController: AllPokemonsDisplayLogic {
    func successGetPokemons(response: AllPokemons.List.ViewModel.Success) {
        pokemonsName = response.items
        self.tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func failureGetPokemons(response: AllPokemons.List.ViewModel.Failure) {
        SVProgressHUD.dismiss()
    }
}
