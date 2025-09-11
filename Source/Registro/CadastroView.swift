//
//  RegistroView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 20/08/25.
//

import SwiftUI

struct CadastroView: View {
    @State var email = ""
    @State var senha = ""
    @State var confirmacaoSenha = ""
    @Environment(\.dismiss) var fecharTelaCadastro
    
    var body: some View {
        VStack(spacing: 24) {
            ImagemInicialCustomizada()
                
            TextfieldCustomizado(placeholder: "Digite seu e-mail", bind: $email)
            TextfieldCustomizado(placeholder: "Digite sua senha", bind: $senha)
            TextfieldCustomizado(placeholder: "Confirme sua senha", bind: $confirmacaoSenha)
            
            BotaoCustomizado(texto: "Cadastrar") {
                print("Cadastrado")
            }
            
            botaoJaPossuiCadastro
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

extension CadastroView {
    var botaoJaPossuiCadastro: some View {
        HStack {
            Text("Já possui uma conta?")
            Button {
                fecharTelaCadastro()
            } label: {
                Text("Entrar")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    CadastroView()
}
