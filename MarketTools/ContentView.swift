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
    @State private var show = false
    var body: some View {
        NavigationStack{
            List{
                Section("Activas"){
                    ForEach(items){ item in
                        Text(item.title)
                    }
                }
                Section("Completadas"){
                    
                }
            }.navigationTitle("Compras")
                .toolbar{
                        ToolbarItem{
                            Button{
                                show.toggle()
                            }label:{
                                Image(systemName: "plus")
                            }
                        }
        }
        
            }.sheet(isPresented: $show, content: {
                NavigationStack{
                    AddView()
                }.presentationDetents([.medium])
            })
        .padding()
    }
}


