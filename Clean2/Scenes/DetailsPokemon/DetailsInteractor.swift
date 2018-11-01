//
//  DetailsInteractor.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import PromiseKit

protocol DetailsBusinessLogic {
    func getDetail(request: Details.ListDetails.Request)
}

protocol DetailsDataStore {
    var details: DetailsPokemon! { get set }
    var indexPokemon: String? { get set }
}

class DetailsInteractor: DetailsBusinessLogic, DetailsDataStore {

    // Var's
    var presenter: DetailsPresentationLogic?
    let worker = DetailsWorker()

    var details:  DetailsPokemon!
    var indexPokemon: String?
    
    func getDetail(request: Details.ListDetails.Request) {
        worker.getDetailsPokemon(indexPokemon: indexPokemon!)
            .done { result in
                self.details = result
                let response = Details.ListDetails.Response.Success(detailsList: result)
                self.presenter?.successDetailsPokemon(response: response)
        }
            .catch { (error) in
                let response = Details.ListDetails.Response.Failure(error: error)
                self.presenter?.failureDetailsPokemon(response: response)
                
        }
    }
}
