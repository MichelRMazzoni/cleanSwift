//
//  GetItemsRouter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

@objc protocol GetItemsRoutingLogic {

}

protocol GetItemsDataPassing {
    var dataStore: GetItemsDataStore? { get }
}

class GetItemsRouter: NSObject, GetItemsRoutingLogic, GetItemsDataPassing {

    // Var's
    weak var viewController: GetItemsViewController?
    var dataStore: GetItemsDataStore?

}
