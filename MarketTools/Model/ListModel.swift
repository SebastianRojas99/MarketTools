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
    @Attribute(.unique) var id:String
    var title:String
    var date:Date
    var  finish:Bool
    var budget:String
    var total:Float
    
    @Relationship(deleteRule:.cascade)
    var articleRelation: [ArticleModel]
    
    init(id:String = UUID().uuidString,title: String = "", date: Date = .now, finish: Bool = false, budget: String = "", total: Float = 0,articleRelation:[ArticleModel] = []) {
        
        self.id = id
        self.title = title
        self.date = date
        self.finish = finish
        self.budget = budget
        self.total = total
        self.articleRelation = articleRelation
    }
}


