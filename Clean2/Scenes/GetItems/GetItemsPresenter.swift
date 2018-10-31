//
//  GetItemsPresenter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol GetItemsPresentationLogic {
    func successGetItems(response: GetItems.GetListItems.Response.Success)
    func failureGetItems(response: GetItems.GetListItems.Response.Failure)

}

class GetItemsPresenter: GetItemsPresentationLogic {
    // Var's
    weak var viewController: GetItemsDisplayLogic?
    
    func successGetItems(response: GetItems.GetListItems.Response.Success) {
        let items = response.itemsList.map { GetItems.GetListItems.ViewModel.ItemsDisplay(title: $0)}
        
        let viewModel = GetItems.GetListItems.ViewModel.Success(items: items)
        self.viewController?.successGetItems(response: viewModel)
        
    }
    
    func failureGetItems(response: GetItems.GetListItems.Response.Failure) {
        
    }

}
