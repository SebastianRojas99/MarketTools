//
//  ContentView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    
    @Query private var items:[ListModel]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
