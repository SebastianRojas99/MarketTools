//
//  ContentView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    
    
    @Query (sort:\ListModel.title,order: .forward) private var items:[ListModel]
    @State private var show = false
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationStack{
            List{
                Section("Activas"){
                    ForEach(items){ item in
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

struct CardView:View {
    var item:ListModel
    var body: some View {
        HStack{
            Circle()
                .foregroundStyle(item.finish ? .green : .gray)
                .frame(width:10 ,height: 10)
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                Text("\(item.date, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                    .font(.callout)
                    .foregroundStyle(.gray)//giving format for date
                Text("\(item.budget)")
            }
        }
    }
}


