//
//  GetItemsConfigurator.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

extension GetItemsViewController {

    // Setup
    func setup() {

        let viewController          = self
        let interactor              = GetItemsInteractor()
        let presenter               = GetItemsPresenter()
        let router                  = GetItemsRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }


    // Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

}
