//
//  Details.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import Foundation

struct DetailsPokemon: Codable {
    var abilities: [abilities]
    var base_experience: Int
    var forms: [forms]
    var game_indices: [game_indices]
    var height: Int
    var held_items: [held_items]?
    var id: Int
    var is_default: Bool
    var location_area_encounters: String
    var moves: [moves]
    var name: String
    var order: Int
    var species: species
    var sprites: sprites
    var stats: [stats]
    var types: [types]
    var weight: Int
}

struct abilities: Codable {
    var ability: ability
    var is_hidden: Bool
    var slot: Int
    
}

struct ability: Codable {
    var name: String
    var url: String
}

struct forms: Codable {
    var name: String
    var url: String
}

struct game_indices: Codable {
    var game_index: Int
    var version: version
}

struct version: Codable {
    var name: String
    var url: String
}

struct held_items: Codable {
    
}

struct moves: Codable {
    var move: move
    var version_group_details: [version_group_details]
}

struct move: Codable {
    var name: String
    var url: String
}

struct version_group_details: Codable {
    var level_learned_at: Int
    var move_learn_method: move_learn_method
    var version_group : version_group
}

struct move_learn_method: Codable {
    var name: String
    var url: String
}

struct version_group: Codable {
    var name: String
    var url: String
}

struct species: Codable {
    var name: String
    var url: String
}

struct sprites: Codable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
}

struct stats: Codable {
    var base_stat: Int
    var effort: Int
    var stat : stat
}

struct stat: Codable {
    var name: String
    var url: String
}

struct types: Codable {
    var slot: Int
    var type: type
}

struct type: Codable {
    var name: String
    var url: String
}
