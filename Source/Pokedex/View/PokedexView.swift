//
//  PokedexView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 21/08/25.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject var viewModel = PokedexViewModel.shared
    @State var textoBusca: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 280)
                
                VStack {
                    
                    campoBusca
                    pokemonScroll
                }
                .padding(24)
                .edgesIgnoringSafeArea(.bottom)
                .background(Color.white.cornerRadius(30)
                    .edgesIgnoringSafeArea(.bottom))
            }
            .background(background)
        }
    }
}

extension PokedexView {
    var campoBusca: some View {
        HStack {
            TextField("Pesquisar Pokémon...", text: $textoBusca)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            Button {
                textoBusca = ""
            } label: {
                if !textoBusca.isEmpty {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.red)
                }
            }
        }
        .padding()
        .background(
            Capsule().stroke(.gray)
        )
    }
    
    var pokemonScroll: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.pokemons) { pokemon in
                if textoBusca.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    PokemonListaItem(pokemon: pokemon)
                } else if let nome = pokemon.nome, nome.lowercased().contains(textoBusca.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()) {
                    PokemonListaItem(pokemon: pokemon)
                }
                
            }
        }
    }
    
    var background: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            Image("backgroundPokedex")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    PokedexView()
}

//VStack {
//    ScrollView(showsIndicators: false) {
//        ForEach(viewModel.pokemons) { pokemon in
//            PokemonListaItem(pokemon: pokemon)
//        }
//    }
//}
//.padding(.horizontal)
//.onAppear {
//    viewModel.receberListaPokemon()
//}
