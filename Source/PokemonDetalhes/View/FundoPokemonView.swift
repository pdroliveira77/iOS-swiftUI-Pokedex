//
//  FundoPokemonView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 24/08/25.
//

import Foundation
import SwiftUI

struct FundoPokemonView: View {
    let cores: [Color]
        
        var body: some View {
            LinearGradient(
                gradient: Gradient(colors: cores.isEmpty
                                   ? [.gray, .gray]
                                   : (cores.count == 1 ? [cores[0].opacity(0.5), cores[0].opacity(0.5)] : cores)),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(50)
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)
        }
}
