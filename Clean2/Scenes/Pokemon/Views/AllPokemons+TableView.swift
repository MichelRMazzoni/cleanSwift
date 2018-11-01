//
//  AllPokemons+TableView.swift
//  Clean2
//
//  Created by Michel Mazzoni on 31/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

extension AllPokemonsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! AllPokemonsTableViewCell
        
        let item = pokemonsName[indexPath.row]
        let name = item.name
        cell.lblTitle.text = name.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
    
}
