//
//  ImagemInicialCustomizada.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 20/08/25.
//

import SwiftUI

struct ImagemInicialCustomizada: View {
    var body: some View {
        Image("imagemInicial")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ImagemInicialCustomizada()
}
