//
//  AllPokemonsRouter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

@objc protocol AllPokemonsRoutingLogic {
    func routeToShowDetail(segue: UIStoryboardSegue)
}

protocol AllPokemonsDataPassing {
    var dataStore: AllPokemonsDataStore? { get }
}

class AllPokemonsRouter: NSObject, AllPokemonsRoutingLogic, AllPokemonsDataPassing {

    // Var's
    weak var viewController: AllPokemonsViewController?
    var dataStore: AllPokemonsDataStore?
    
    func routeToShowDetail(segue: UIStoryboardSegue) {
        //Não é uma boa prática forçar cast, se o projeto usar lint vai dar erro de compilação
        
        let destinationVC = segue.destination as! DetailsViewController
        let indexPokemon = viewController?.tableView.indexPathForSelectedRow?.row
         var destinationDS = destinationVC.router!.dataStore!
        
        //O certo seria pegar o do datastore da cena e passar o parametro selecionado para a próxima view
        
        guard let datastore = dataStore, let row = viewController?.tableView.indexPathForSelectedRow?.row else {
                    return
        }
        destinationDS.indexPokemon =  dataStore?.pokemon[row].url
        
        // esse jeito de passar dado faz com que aja uma grande chance de dar erro na aplicação
        // esse caso os pokemons estão ordenados pelos ids deles
        // mas caso a api mude a aplicação quebra

        
//        let indexTwo = indexPokemon! + 1
//        destinationDS.indexPokemon = indexTwo
        
        
    }
}
