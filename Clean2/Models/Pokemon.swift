//
//  Pokemon.swift
//  Clean2
//
//  Created by Michel Mazzoni on 26/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation

struct GetPokemons: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}
