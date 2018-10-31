//
//  AllPokemonsViewController.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol showPokemonsInput {
    func successGetPokemons(viewModel: AllPokemons.List.ViewModel.Success)
    func failureGetPokemons(viewModel: AllPokemons.List.ViewModel.Failure)
}

class AllPokemonsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, showPokemonsInput {

    @IBOutlet weak var tableView: UITableView!
    
    // Var's
    var interactor: AllPokemonsBusinessLogic?
    var router: (NSObjectProtocol & AllPokemonsRoutingLogic & AllPokemonsDataPassing)?
    var pokemonsName = [AllPokemons.List.ViewModel.PokemonsDisplay]()
    

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
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show()
        getPokemons()
    }
    
    func getPokemons(){
        let request = AllPokemons.List.Request()
        interactor?.getPokemons(request: request)
    }

    func successGetPokemons(viewModel: AllPokemons.List.ViewModel.Success) {
        pokemonsName.append(contentsOf: viewModel.items)
        self.tableView.reloadData()
        
    }
    
    func failureGetPokemons(viewModel: AllPokemons.List.ViewModel.Failure) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleGetItemsTableViewCell
        
        let item = pokemonsName[indexPath.row]
        let name = item.name
        cell.lblTitle.text = name.capitalized
        cell.imgDetail.image = UIImage(named: "icMore")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
}
