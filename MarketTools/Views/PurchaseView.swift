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
         VStack{
             VStack{
                 TextField("article",text:$article).textFieldStyle(.roundedBorder).focused($isFocus)
                 HStack{
                     TextField("pricing",text:$price ).textFieldStyle(.roundedBorder).focused($isFocus).keyboardType(.decimalPad).frame(width: 100)
                     Spacer()
                     CounterView(counter: $quantity)
                 }
                 HStack{
                     Button{
                     //let art =  (Float(price) ?? 0) * Float(quantity)
                     }label: {
                         Text("agregar")
                     }
                     Spacer()
                     Text("cash able: $\(itemListModel.budget)").bold()
                 }
                  
                 }.padding(.all)
             List{
                 Section("Chart"){
                     
                 }
             }
         }.navigationTitle(itemListModel.title)
             .navigationBarTitleDisplayMode(.large)
    }
}


