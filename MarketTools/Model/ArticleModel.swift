//
//  ArticleModel.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 14/04/2024.
//

import Foundation
import SwiftData

@Model
final class ArticleModel{
    @Attribute(.unique) var article: String
    let pricing :   Float
    let idList : String
    
    init(article: String, pricing: Float, idList: String) {
        self.article = article
        self.pricing = pricing
        self.idList = idList
    }
}

