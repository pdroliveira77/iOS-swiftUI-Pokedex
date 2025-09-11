//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 24/08/25.
//

import Foundation
import SwiftUI

class PokedexViewModel: ObservableObject {
    @Published var pokemons = [IndexPokemon]()
    
    static let shared = PokedexViewModel()
    
    private init() {
        receberListaPokemon()
    }
}

extension PokedexViewModel {
    func receberListaPokemon() {
        let quantidadePokemon = 151
        let offset = 0
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(quantidadePokemon)&offset=\(offset)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                let listaPokemon = try? JSONDecoder().decode(ListaPokemon.self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = listaPokemon?.resultados ?? []
                }
            }
        }.resume()
    }
}
