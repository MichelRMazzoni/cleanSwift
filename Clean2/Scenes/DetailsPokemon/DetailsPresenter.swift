//
//  DetailsPresenter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol DetailsPresentationLogic {
    func successDetailsPokemon(response: Details.ListDetails.Response.Success)
    func failureDetailsPokemon(response: Details.ListDetails.Response.Failure)
}

class DetailsPresenter: DetailsPresentationLogic {

    // Var's
    weak var viewController: DetailsDisplayLogic?
    
    
    func successDetailsPokemon(response: Details.ListDetails.Response.Success) {
        let details = Details.ListDetails.ViewModel.DetailsDisplay(
            id: response.detailsList.id,
            name: response.detailsList.name,
            weight: response.detailsList.weight,
            base_experience: response.detailsList.base_experience,
            height: response.detailsList.height,
            sprites: response.detailsList.sprites.front_default
            )
        
        let vm = Details.ListDetails.ViewModel.Success(items: details)
        viewController?.successGetDetails(response: vm)
    }
    
    func failureDetailsPokemon(response: Details.ListDetails.Response.Failure) {
        let vm = Details.ListDetails.ViewModel.Failure(message: response.error.localizedDescription)
        self.viewController?.failureGetDetails(response: vm)
    }

}
