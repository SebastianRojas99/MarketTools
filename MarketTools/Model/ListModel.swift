//
//  ListModel.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 07/04/2024.
//

import Foundation
import SwiftData


@Model

final class ListModel{
    var title:String
    var date:Date
    var  finish:Bool
    var budget:String
    var total:Float
    
    init(title: String = "", date: Date = .now, finish: Bool = false, budget: String = "", total: Float = 0) {
        self.title = title
        self.date = date
        self.finish = finish
        self.budget = budget
        self.total = total
    }
}
