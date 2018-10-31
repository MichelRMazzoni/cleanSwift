//
//  GetItemsViewController.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

class GetItemsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Var's
    var interactor: GetItemsBusinessLogic?
    var router: (NSObjectProtocol & GetItemsRoutingLogic & GetItemsDataPassing)?
    
    var titleItems = [GetItems.GetListItems.ViewModel.ItemsDisplay]()
    
    
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        getTitles()
    }
    
    func getTitles(){
        let request = GetItems.GetListItems.Request()
        self.interactor?.getItemsTitle(request: request)
    }
    
}
