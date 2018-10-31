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
        let destinationVC = segue.destination as! DetailsViewController
        let indexPokemon = viewController?.tableView.indexPathForSelectedRow?.row
        let indexTwo = indexPokemon! + 1
        var destinationDS = destinationVC.router!.dataStore!
        destinationDS.indexPokemon = indexTwo
        
        
    }
}
