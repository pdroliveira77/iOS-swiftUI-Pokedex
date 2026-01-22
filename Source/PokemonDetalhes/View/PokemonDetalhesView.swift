//
//  PokemonDetalhesView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 23/08/25.
//

import SwiftUI

struct PokemonDetalhesView: View {
    @ObservedObject var viewModel: PokemonDetalhesViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 24) {
            if let pokemon = viewModel.pokemon {
               
                FundoPokemonView(
                    cores: pokemon.tipos.map { viewModel.receberHexColor($0.color) }
                )
                    .overlay(imagemPokemon(pokemon))
                
                nomePokemon(pokemon)
                
                HStack(spacing: 24) {
                    ForEach(pokemon.tipos, id: \.self) { tipo in
                        Text(tipo.rawValue)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(
                                Capsule()
                                    .fill(viewModel.receberHexColor(tipo.color))
                            )
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        HStack {
                            pesoPokemon(pokemon)
                            Spacer()
                            alturaPokemon(pokemon)
                        }
                        
                        VStack(spacing: 24) {
                            Text("Detalhes")
                                .font(.title)
                                .fontWeight(.heavy)
                            
                            if pokemon.stats.isEmpty {
                                Text("Nenhum status disponível")
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach(pokemon.stats) { status in
                                    HStack
                                    {
                                        StatusBarView(nome: status.nome, valor: Double(status.valor))
                                        

                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 64)
                }
            } else {
                ProgressView()
            }
        }
        .toolbar(.hidden)
        .onAppear { viewModel.receberPokemon() }
        .overlay(botaoVoltar, alignment: .topLeading)
    }
}

extension PokemonDetalhesView {
    
    var botaoVoltar: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
        }
    }
    
    func imagemPokemon(_ pokemon: Pokemon) -> some View {
        AsyncImage(url: URL(string: pokemon.urlImagem)) { imagem in
            imagem.resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        } placeholder: {
            ProgressView()
        }
    }
    
    func nomePokemon(_ pokemon: Pokemon) -> some View {
        HStack {
            Text(pokemon.nome.capitalized)
                .fontWeight(.heavy)
            
            Text("#\(viewModel.formatarNumero(pokemon.id))")
                .foregroundColor(.gray.opacity(0.5))
                .fontWeight(.bold)
        }
        .font(.title)
    }
    
    func pesoPokemon(_ pokemon: Pokemon) -> some View {
        VStack {
            Text("Peso")
                .font(.title3)
                .fontWeight(.bold)
            Text("\(String(format: "%.1f", Double(pokemon.weight / 10))) kg")
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
    
    func alturaPokemon(_ pokemon: Pokemon) -> some View {
        VStack {
            Text("Altura")
                .font(.title3)
                .fontWeight(.bold)
            Text("\(String(format: "%.1f", Double(pokemon.height / 10))) cm")
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
}

#Preview {
    PokemonDetalhesView(viewModel: PokemonDetalhesViewModel(pokemonIndex: IndexPokemon(nome: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/2/")))
}
