//
//  ContentView.swift
//  Pokedex
//
//  Created by Pedro Oliveira on 19/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            Color.green
                .padding()
                .frame(height: 400)
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    Color.black.frame(width: 100, height: 100)
                    Color.green.frame(width: 100, height: 100)
                    Color.black.frame(width: 100, height: 100)
                }
                
                HStack(spacing: 0) {
                    Color.green.frame(width: 100, height: 50)
                    Color.black.frame(width: 100, height: 50)
                    Color.green.frame(width: 100, height: 50)
                }
                
                HStack(spacing: 0) {
                    Color.black.frame(width: 200, height: 100)
                }
                
                HStack(spacing: 0) {
                    Color.black.frame(width: 50, height: 50).padding(.leading, 50)
                    Color.green.frame(width: 100, height: 50)
                    Color.black.frame(width: 50, height: 50).padding(.trailing, 50)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
