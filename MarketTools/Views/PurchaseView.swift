//
//  PurchaseView.swift
//  MarketTools
//
//  Created by Sebastian Marquez Rojas on 13/04/2024.
//

import SwiftUI
import SwiftData


struct PurchaseView: View {
    
    @Bindable var itemListModel:ListModel
    @Query private var articles:[ArticleModel]
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var article = ""
    @State private var price = ""
    @State private var quantity = 1
    @FocusState private var isFocus:Bool
    var finalPrice:Float{
        articles.filter{$0.idList.contains(itemListModel.id)}.reduce(0.0) {$0 + $1.pricing}
    }
    //MARK: pendiente de solucion de swiftdata
    /*
    init(itemListModel:ListModel){
        self.itemListModel = itemListModel
        _article = Query(filter: #Predicate<ArticleModel> { $0.idList.contains(itemListModel.id)
        } )
    }*/
 
     var body: some View {
         VStack{
             VStack{
                 TextField("article",text:$article).textFieldStyle(.roundedBorder).focused($isFocus)
                 HStack{
                     TextField("pricing",text:$price ).textFieldStyle(.roundedBorder).focused($isFocus).keyboardType(.decimalPad).frame(width: 100)
                     Spacer()
                     CounterView(counter: $quantity)
                 }
                 HStack{
                     Button{
                     let totalPricing =   (Float(price) ?? 0) * Float(quantity)
                         let newArticle = ArticleModel(article: article, pricing: totalPricing, idList: itemListModel.id)
                         itemListModel.articleRelation.append(newArticle)
                         isFocus = true
                         article = ""
                         price = ""
                         quantity = 1
                         
                         let updateBudget = (Float(itemListModel.budget) ?? 0) - totalPricing
                         itemListModel.budget = String(updateBudget)
                     }label: {
                         Text("agregar")
                     }
                     Spacer()
                     Text("price: $\(itemListModel.budget)").bold()
                 }
                  
                 }.padding(.all)
             List{
                 Section("Chart"){
                     ForEach(articles.filter {$0.idList.contains(itemListModel.id)} ){ item in //filtro usado solo por bd chica
                         HStack{
                             Text(item.article)
                             Spacer()
                             Text(item.pricing.formatted())
                                 .swipeActions{
                                     Button(role:.destructive){
                                         withAnimation{
                                             let add = (Float(itemListModel.budget) ?? 0) + item.pricing
                                             itemListModel.budget = String(add)
                                             context.delete(item)
                                         }
                                     }label: {
                                        Image(systemName: "trash")
                                     }
                                 }
                         }
                     }
                     HStack{
                         Text("Total:")
                         Spacer()
                         Text(" $\(finalPrice.formatted())").bold()
                     }
                 }
             }
         }.navigationTitle(itemListModel.title)
             .navigationBarTitleDisplayMode(.large)
             .toolbar{
                 ToolbarItem{
                     Button{
                         itemListModel.finish = true
                         itemListModel.total = finalPrice
                         dismiss()
                     }label: {
                         Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                     }
                 }
             }
    }
}


