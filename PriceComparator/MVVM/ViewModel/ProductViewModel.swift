//
//  ProductViewModel.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 23/11/22.
//

import Foundation

struct ProductViewModel {
    private var product: Product

    init(product: Product) {
        self.product = product
    }
        
    var amount: Float? {
        get {
            product.amount
        }
        
        set {
            product.amount = newValue
        }
    }
    
    var price: Float? {
        get {
            product.price
        }
        
        set {
            product.price = newValue
        }
    }
    
    var priceOfGram: Float? {
        get {
            product.priceOfGram()
        }
    }
}
