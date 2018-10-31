//
//  DetailsRouter.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

@objc protocol DetailsRoutingLogic {

}

protocol DetailsDataPassing {
    var dataStore: DetailsDataStore? { get }
}

class DetailsRouter: NSObject, DetailsRoutingLogic, DetailsDataPassing {

    // Var's
    weak var viewController: DetailsViewController?
    var dataStore: DetailsDataStore?

}
