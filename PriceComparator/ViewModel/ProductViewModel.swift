//
//  ProductViewModel.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 23/11/22.
//

import Foundation

class ProductViewModel {
    let product: Product
    
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
    
    init(product: Product) {
        self.product = product
    }
}
