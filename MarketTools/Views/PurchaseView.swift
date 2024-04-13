//
//  PurchaseView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 13/04/2024.
//

import SwiftUI
import SwiftData


struct PurchaseView: View {
    
    @Bindable var itemListModel:ListModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var article = ""
    @State private var price = ""
    @State private var quantity = 1
    
    @FocusState private var isFocus:Bool
    
     var body: some View {
        Text(itemListModel.title)
    }
}


