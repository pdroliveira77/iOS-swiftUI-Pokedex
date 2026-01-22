//
//  StatusBarView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 21/01/26.
//

import SwiftUI

struct StatusBarView: View {
    let nome: String
    let valor: Double
    private let minimo = 0.0
    private let maximo = 130.0
    private var corValor: Color {
        if valor < 30 {
            return .red
        } else if valor < 65 {
            return .yellow
        } else {
            return .green
        }
    }
    
    var body: some View {
        Gauge(value: valor, in: minimo...maximo) {
            Text(nome.capitalized)
        } currentValueLabel: {
            Text("")
                .foregroundStyle(corValor)
        } minimumValueLabel: {
            Text("")
                .foregroundStyle(corValor)
        } maximumValueLabel: {
            Text("\(Int(valor))")
                .foregroundStyle(corValor)
        }.gaugeStyle(.linearCapacity)
    }
}
