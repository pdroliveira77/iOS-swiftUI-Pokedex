//
//  PokedexModel.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 21/08/25.
//

import Foundation

struct ListaPokemon: Decodable {
    let resultados: [IndexPokemon]?
    
    enum CodingKeys: String, CodingKey {
        case resultados = "results"
    }
}

struct IndexPokemon: Decodable, Identifiable {
    let nome: String?
    let url: String?
    
    var id: UUID {
        UUID()
    }
    
    enum CodingKeys: String, CodingKey {
        case nome = "name"
        case url
    }
}

struct DetalhesPokemon: Decodable {
    let nome: String?
    let height, weight: Double?
    let id: Int?
    let sprites: DetalhesSpritesPokemon?
    let tipos: [DetalhesTiposPokemon]?
    let stats: [DetalhesPokemonStatus]?
    
    enum CodingKeys: String, CodingKey {
        case nome = "name"
        case height
        case weight
        case id
        case sprites
        case tipos = "types"
        case stats
    }
}

struct DetalhesTiposPokemon: Decodable {
    let tipo: DescricaoTiposPokemon?
    
    enum CodingKeys: String, CodingKey {
        case tipo = "type"
    }
}

struct DetalhesSpritesPokemon: Decodable {
    let imagemPadrao: String?
    
    enum CodingKeys: String, CodingKey {
        case imagemPadrao = "front_default"
    }
}

struct DescricaoTiposPokemon: Decodable {
    let nome: String?
    
    enum CodingKeys: String, CodingKey {
        case nome = "name"
    }
}

struct DetalhesPokemonStatus: Decodable {
    let base_stat: Int?
    let stat: DetalhesPokemonStatusDescricao?
}

struct DetalhesPokemonStatusDescricao: Decodable {
    let name: String?
}
