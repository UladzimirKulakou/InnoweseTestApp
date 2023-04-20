//
//  PokemonListModel.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 20.04.23.
//

import Foundation

struct PokemonAPIList: Codable {
    
    let count: Int
    let next: String
    let previous: String?
    let results: PokemonShortView
    
}

struct PokemonShortView: Codable {
    let name: String
    let url: String
}

struct PokemonFullView: Codable {
    let name: String
    let types: PokemonType
    let weight: Int
    let sprites:PokemonImage
    
}

struct PokemonImage: Codable {
    let front_default: String
}

struct PokemonType: Codable {
    let slot: Int
    let type: PokemonTypeName
}

struct PokemonTypeName: Codable {
    let name: String
    let url: String
}
