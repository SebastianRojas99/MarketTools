//
//  CardView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 13/04/2024.
//

import SwiftUI

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


