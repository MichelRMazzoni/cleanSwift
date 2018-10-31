//
//  GetItemsViewController+DisplayLogic.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol GetItemsDisplayLogic: class {
    func successGetItems(response: GetItems.GetListItems.ViewModel.Success)
    func failureGetItems(response: GetItems.GetListItems.ViewModel.Failure)
}

extension GetItemsViewController: GetItemsDisplayLogic {
    func successGetItems(response: GetItems.GetListItems.ViewModel.Success) {
        titleItems = response.items
        self.tableView.reloadData()
    }
    
    func failureGetItems(response: GetItems.GetListItems.ViewModel.Failure) {
        
    }
    

}
