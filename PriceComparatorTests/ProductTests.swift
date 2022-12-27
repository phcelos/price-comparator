//
//  ProductTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 26/12/22.
//

import XCTest

@testable import PriceComparator

class ProductTests: XCTestCase {
    func test_priceOfGram_whenProductAmountIsZero_shouldReturnNil() {
        let sut = Product(price: 10, amount: 0)
        XCTAssertNil(sut.priceOfGram())
    }
    
    func test_priceOfGram_whenProductPriceIsNil_shouldReturnNil() {
        let sut = Product(price: nil, amount: 0)
        XCTAssertNil(sut.priceOfGram())
    }
    
    func test_priceOfGram_whenProductAmountIsNil_shouldReturnNil() {
        let sut = Product(price: 0, amount: nil)
        XCTAssertNil(sut.priceOfGram())
    }
    
    func test_priceOfGram_whenProductPriceAndAmountAreValid_shouldReturnValidValue() {
        let sut = Product(price: 100, amount: 20)
        XCTAssertEqual(sut.priceOfGram(), 5)
    }
}
