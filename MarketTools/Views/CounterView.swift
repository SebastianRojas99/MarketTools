//
//  CounterView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 14/04/2024.
//

import SwiftUI

struct CounterView: View {
    @Binding var counter : Int
    var body: some View {
        HStack{
            Button{
                counter -= 1
                if counter <= 1{
                    counter = 1
                }
            }label: {
                Image(systemName: "minus")
            }
            Button{
                counter += 1
                
            }label: {
                Image(systemName: "plus")
            }
            Text("\(counter)")
            
            
        }
    }
}

