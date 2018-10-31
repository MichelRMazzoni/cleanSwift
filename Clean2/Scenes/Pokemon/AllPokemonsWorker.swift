//
//  AllPokemonsWorker.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import PromiseKit

class AllPokemonsWorker {

    func getList() -> Promise<[Pokemon]> {
        return Webservice.GetAllPokemons.getAllPokemons()
    }

}
