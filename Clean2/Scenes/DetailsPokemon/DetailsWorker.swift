//
//  DetailsWorker.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import PromiseKit

class DetailsWorker {
    
    func getDetailsPokemon(indexPokemon: Int) -> Promise<DetailsPokemon> {
        return Webservice.GetDetails.getDetails(indexPokemon: indexPokemon)
    }

}
