//
//  ContentView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    
    
    @Query (filter: #Predicate<ListModel> {$0.finish == false}) private var items:[ListModel]
    @Query (filter: #Predicate<ListModel> {$0.finish == true}) private var itemsComplete:[ListModel]
    @State private var show = false
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationStack{
            List{
                Section("Activas"){
                    ForEach(items){ item in
                        NavigationLink(value:item){
                            CardView(item: item)
                                .swipeActions{
                                    Button(role:.destructive){
                                        withAnimation{
                                            context.delete(item)
                                        }
                                    }label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                    }
                }
                Section("Completadas"){
                    Section("Activas"){
                        ForEach(itemsComplete){ item in
                            NavigationLink(value:item){
                                CardCompleteView(item: item)
                                    .swipeActions{
                                        Button(role:.destructive){
                                            withAnimation{
                                                context.delete(item)
                                            }
                                        }label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                            }
                            }
                        }
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
                .navigationDestination(for: ListModel.self){
                    PurchaseView(itemListModel: $0)
                }
                .sheet(isPresented: $show, content: {
                        NavigationStack{
                            AddView()
                        }.presentationDetents([.medium])
                    })
            }
    }
}


