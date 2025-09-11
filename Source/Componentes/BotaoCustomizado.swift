//
//  BotaoCustomizado.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 20/08/25.
//

import SwiftUI

struct BotaoCustomizado: View {
    var texto = ""
    var acao: () -> Void = {}
    
    var body: some View {
        Button {
            acao()
        } label: {
            Text(texto)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}

#Preview {
    BotaoCustomizado(texto: "Login", acao: {})
}
