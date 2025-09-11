//
//  PokemonListaItem.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 25/08/25.
//

import SwiftUI

struct PokemonListaItem: View {
    var pokemon: IndexPokemon
    
    var body: some View {
        
        NavigationLink {
            PokemonDetalhesView(viewModel: PokemonDetalhesViewModel(pokemonIndex: pokemon))
        } label: {
            VStack {
                HStack(spacing: 24) {
                    Image("pokebola")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(pokemon.nome?.capitalized ?? "Desconhecido")
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                }
                .padding(.vertical)
                Divider()
            }
        }
    }
}

#Preview {
    PokemonListaItem(pokemon: IndexPokemon(nome: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/2/"))
}
