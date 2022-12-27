//
//  ProductComparatorTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 22/11/22.
//

import XCTest

@testable import PriceComparator

class ProductComparatorTests: XCTestCase {
    func test_calculateTheCheapestProduct_givenProduct1IsTheCheapest_shouldReturnProduct1() {
        let priceOfGram1 = Product(price: 10, amount: 100).priceOfGram()!
        let priceOfGram2 = Product(price: 40, amount: 300).priceOfGram()!
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            priceOfGram1: priceOfGram1,
            priceOfGram2: priceOfGram2
        )
        
        XCTAssertEqual(chepeastProduct, .product1)
    }
    
    func test_calculateTheCheapestProduct_givenProduct2IsTheCheapest_shouldReturnProduct2() {
        let priceOfGram1 = Product(price: 10, amount: 100).priceOfGram()!
        let priceOfGram2 = Product(price: 20, amount: 300).priceOfGram()!
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            priceOfGram1: priceOfGram1,
            priceOfGram2: priceOfGram2
        )
        
        XCTAssertEqual(chepeastProduct, .product2)
    }
    
    func test_calculateTheCheapestProduct_whenProductsAreEqual() {
        let priceOfGram1 = Product(price: 10, amount: 100).priceOfGram()!
        let priceOfGram2 = Product(price: 30, amount: 300).priceOfGram()!
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            priceOfGram1: priceOfGram1,
            priceOfGram2: priceOfGram2
        )
        
        XCTAssertEqual(chepeastProduct, .equal)
    }
}
