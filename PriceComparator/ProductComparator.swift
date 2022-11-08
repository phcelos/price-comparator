//
//  ProportionalPriceComparator.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

struct ProductComparator {
    
    private init() {}
    
    static func calculateTheChepeastProduct(product1: Product, product2: Product) -> ChepeastProduct? {
        guard
            let priceOfGram1 = gramPriceOf(product: product1),
            let priceOfGram2 = gramPriceOf(product: product2)
        else {
            return nil
        }
        
        return comparePricesOfGrams(priceOfGram1, priceOfGram2)
    }
    
    private static func gramPriceOf(product: Product) -> Float? {
        guard
            let fullPrice = product.price,
            let amount = product.amount
        else {
            return nil
        }
        return fullPrice/amount
    }
    
    private static func comparePricesOfGrams(_ priceOfGram1: Float, _ priceOfGram2: Float) -> ChepeastProduct {
        if priceOfGram1 < priceOfGram2 {
            return .product1
        } else if priceOfGram1 > priceOfGram2 {
            return .product2
        } else {
            return .equal
        }
    }
}
