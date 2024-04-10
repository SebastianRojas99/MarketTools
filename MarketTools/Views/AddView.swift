//
//  AddView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import SwiftUI
import SwiftData
struct AddView: View {
    @State private var item = ListModel()
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List{
            TextField("enter your article",text: $item.title)
            TextField("enter the buy value",text: $item.budget)
                .keyboardType(.numberPad)
            DatePicker("date",selection:$item.date)
            Button{
                withAnimation{
                    context.insert(item)
                }
                dismiss()
            }label: {
                Text("save")
            }.navigationTitle("Create buy")
        }
    }
}


 
