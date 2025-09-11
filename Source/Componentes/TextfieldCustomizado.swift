//
//  TextfieldCustomizado.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 20/08/25.
//

import SwiftUI

struct TextfieldCustomizado: View {
    var placeholder = ""
    @Binding var bind: String
    var isCampoSenha = false
    
    var body: some View {
        Group {
            if isCampoSenha {
                SecureField(placeholder, text: $bind)
            } else {
                TextField(placeholder, text: $bind)
            }
        }
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(style: StrokeStyle(lineWidth: 1)))
    }
}


#Preview {
    TextfieldCustomizado(placeholder: "Digite seu e-mail", bind: .constant(""))
}
