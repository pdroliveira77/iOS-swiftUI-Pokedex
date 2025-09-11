//
//  LoginView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 20/08/25.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var senha = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                ImagemInicialCustomizada()
                
                TextfieldCustomizado(placeholder: "Digite seu e-mail", bind: $email)
                
                TextfieldCustomizado(placeholder: "Digite sua senha", bind: $senha, isCampoSenha: true)
                
                BotaoCustomizado(texto: "Login") {
                    print("email \(email) - senha \(senha)")
                }
                
                botaoAindaNaoPossuiLogin
            }
            .padding(.horizontal)
        }
    }
}

extension LoginView {
    var botaoAindaNaoPossuiLogin: some View {
        HStack {
            Text("Ainda não possui uma conta?")
            NavigationLink {
                CadastroView()
            } label: {
                Text("Cadastrar")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    LoginView()
}
