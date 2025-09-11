//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 24/08/25.
//

import Foundation

struct Pokemon {
    let nome: String
    let id: Int
    let height, weight: Double
    let urlImagem: String
    let tipos: [PokemonTipoModel]
    let stats: [PokemonStatus]
}

struct PokemonStatus: Identifiable {
    let id = UUID().uuidString
    let nome: String
    let valor: Int
}
