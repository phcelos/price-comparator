//
//  ProportionalPriceComparator.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

struct ProductComparator {
    
    private init() {}
    
    static func calculateTheChepeastProduct(amount1InGrams amount1: Float?, price1: Float?, amount2InGrams amount2: Float?, price2: Float?) -> ChepeastProduct? {
        guard
            let price1 = price1,
            let amount1 = amount1,
            let price2 = price2,
            let amount2 = amount2 else { return nil }
        
        if price1/amount1 < price2/amount2 {
            return .product1
        } else if price1/amount1 > price2/amount2 {
            return .product2
        } else {
            return ChepeastProduct.none
        }
    }
}
