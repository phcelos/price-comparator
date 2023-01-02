//
//  Product.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 08/11/22.
//

typealias Grams = Float

struct Product {
    var price: Float?
    var amount: Float?
    
    func priceOfGram() -> Float? {
        guard
            let fullPrice = price,
            let amount = self.amount, amount != 0
        else {
            return nil
        }
        
        return fullPrice/amount
    }
}
