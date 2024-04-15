//
//  CardCompleteView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 15/04/2024.
//


import SwiftUI

struct CardCompleteView:View {
    var item:ListModel
    var body: some View {
        HStack{
            Circle()
                .foregroundStyle(.green)
                .frame(width:10 ,height: 10)
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                Text("Fin al: $\(item.budget) Total purchase: $\(item.total.formatted())") 
                    .font(.callout)
                    .foregroundStyle(.gray)//giving format for date
                Text("\(item.budget)")
            }
        }
    }
}

