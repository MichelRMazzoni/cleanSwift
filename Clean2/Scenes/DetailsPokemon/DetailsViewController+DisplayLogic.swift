//
//  DetailsViewController+DisplayLogic.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

protocol DetailsDisplayLogic: class {
    func successGetDetails(response: Details.ListDetails.ViewModel.Success)
    func failureGetDetails(response: Details.ListDetails.ViewModel.Failure)
}

extension DetailsViewController: DetailsDisplayLogic {
    func successGetDetails(response: Details.ListDetails.ViewModel.Success) {
        imgPokemon.sd_setImage(with: URL(string: response.items.sprites!), placeholderImage: UIImage(named: "icMore"))
        name.text = "Name: \(String(describing: response.items.name!.uppercased()))"
        id.text = "Id: \(String(describing: response.items.id!))"
        weight.text = "Weight: \(String(describing: response.items.weight!))"
        height.text = "Heigth: \(String(describing: response.items.height!))"
        base_experience.text = "Base experience: \(String(describing: response.items.base_experience!))"
        navigationItem.title = "Details of " + response.items.name!.capitalized
        SVProgressHUD.dismiss()
        
    }
    
    func failureGetDetails(response: Details.ListDetails.ViewModel.Failure) {
        SVProgressHUD.dismiss()
    }
}
