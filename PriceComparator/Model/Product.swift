//
//  Product.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 08/11/22.
//

typealias Grams = Float

class Product {
    var price: Float?
    var amount: Float?
    
    init(price: Float? = nil, amount: Float? = nil) {
        self.price = price
        self.amount = amount
    }
}
