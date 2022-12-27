//
//  ProportionalPriceComparator.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

struct ProductComparator {
    
    private init() {}
    
    static func calculateTheChepeastProduct(priceOfGram1: Float, priceOfGram2: Float) -> ChepeastProduct {
        if priceOfGram1 < priceOfGram2 {
            return .product1
        } else if priceOfGram1 > priceOfGram2 {
            return .product2
        } else {
            return .equal
        }
    }
}
