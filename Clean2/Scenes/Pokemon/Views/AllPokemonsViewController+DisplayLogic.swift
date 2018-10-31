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
    func successGetPokemons(response: AllPokemons.GetAllPokemons.ViewModel.Success)
    func failureGetPokemons(response: AllPokemons.GetAllPokemons.ViewModel.Failure)
}

extension AllPokemonsViewController: AllPokemonsDisplayLogic {
    func successGetPokemons(response: AllPokemons.GetAllPokemons.ViewModel.Success) {
        pokemonsName = response.items
        self.tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func failureGetPokemons(response: AllPokemons.GetAllPokemons.ViewModel.Failure) {
        let alert = UIAlertController(title: "Poke APi", message: "Erro ao baixar pokemons", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        SVProgressHUD.dismiss()
    }
}
