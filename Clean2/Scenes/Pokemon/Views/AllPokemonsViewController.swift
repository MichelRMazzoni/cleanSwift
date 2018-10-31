//
//  AllPokemonsViewController.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SVProgressHUD

class AllPokemonsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    // Var's
    var interactor: AllPokemonsBusinessLogic?
    var router: (NSObjectProtocol & AllPokemonsRoutingLogic & AllPokemonsDataPassing)?
    var pokemonsName = [AllPokemons.GetAllPokemons.ViewModel.PokemonsDisplay]()
    

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
        tableView.register(UINib(nibName: "AllPokemonsTableViewCell", bundle: nil), forCellReuseIdentifier: "titleCell")
        getPokemons()
    }
    
    func showSpinner(){
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show()
    }
    
    func getPokemons(){
        showSpinner()
        let request = AllPokemons.GetAllPokemons.Request()
        interactor?.getPokemons(request: request)
    }

    
    
}
