//
//  PokemonDetalhesViewModel.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 24/08/25.
//

import Foundation
import SwiftUI

class PokemonDetalhesViewModel: ObservableObject {
    var pokemonIndex: IndexPokemon
    @Published var pokemon: Pokemon?
    
    init(pokemonIndex: IndexPokemon) {
        self.pokemonIndex = pokemonIndex
    }
}

extension PokemonDetalhesViewModel {
    func receberPokemon() {
        guard let urlString = pokemonIndex.url, let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let pokemon = try? JSONDecoder().decode(DetalhesPokemon.self, from: data) {
                let novoPokemon = Pokemon(nome: pokemon.nome ?? "Desconhecido",
                                          id: pokemon.id ?? 0,
                                          height: pokemon.height ?? 0,
                                          weight: pokemon.weight ?? 0,
                                          urlImagem: pokemon.sprites?.imagemPadrao ?? "",
                                          tipos: pokemon.tipos?.compactMap{ PokemonTipoModel(rawValue: $0.tipo?.nome ?? "unknown")} ?? [],
                                          stats: pokemon.stats?.compactMap{ PokemonStatus(nome: $0.stat?.name ?? "", valor: $0.base_stat ?? 0) } ?? [])
                
                DispatchQueue.main.async {
                    self.pokemon = novoPokemon
                }
            }
        }.resume()
    }
    
    func formatarNumero(_ numero: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 3
        return numberFormatter.string(from: NSNumber(value: numero)) ?? ""
    }
    
    func receberHexColor(_ hex: String) -> Color {
        if let numeroHex = UInt32(hex, radix: 16) {
            let vermelho = Double((numeroHex & 0xFF0000) >> 16) / 255.0
            let verde = Double((numeroHex & 0x00FF00) >> 8) / 255.0
            let azul = Double(numeroHex & 0x0000FF) / 255.0
            return Color(red: vermelho, green: verde, blue: azul, opacity: 1)
        }
        return Color(red: 0, green: 0, blue: 0, opacity: 1)
    }
}
