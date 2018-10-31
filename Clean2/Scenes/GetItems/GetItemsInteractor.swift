//
//  GetItemsInteractor.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

protocol GetItemsBusinessLogic {
    func getItemsTitle(request: GetItems.GetListItems.Request)
}

protocol GetItemsDataStore {
    var itemTitle : [String] { get }
}

class GetItemsInteractor: GetItemsBusinessLogic, GetItemsDataStore {
    var itemTitle = [String]()
    
    func getItemsTitle(request: GetItems.GetListItems.Request) {
        itemTitle = worker.GetValues()
        
        if itemTitle.isEmpty{
            print(GetItems.GetListItems.Response.Failure.self)
        }else{
            let response = GetItems.GetListItems.Response.Success(itemsList: itemTitle)
            self.presenter?.successGetItems(response: response)
        }
    }

    // Var's
    var presenter: GetItemsPresentationLogic?
    let worker = GetItemsWorker()

}
