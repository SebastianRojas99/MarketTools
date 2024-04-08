//
//  MarketToolsApp.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import SwiftUI
import SwiftData
@main
struct MarketToolsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for:ListModel.self)
        }
    }
}
