//
//  ResultLabelViewModel.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 26/12/22.
//

import XCTest

@testable import PriceComparator

final class ResultLabelViewModelTests: XCTestCase {
    private func makeSut() -> ResultLabelViewModel {
        ResultLabelViewModel()
    }
        
    func test_compareProducts_whenSomeValueIsNil_shouldReturnDefaultText() {
        var sut = makeSut()
        sut.updateResultLabel = { resultText in
            XCTAssertEqual(resultText, "-")
        }
        
        let (product1ViewModel, product2ViewModel) = generateTwoProductsViewModels()
        
        sut.compareProducts(
            product1ViewModel: product1ViewModel,
            product2ViewModel: product2ViewModel
        )
    }
        
    func test_compareProducts_whenGivenValidParameters_shouldReturnChepeastProduct() {
        var sut = makeSut()
        sut.updateResultLabel = { resultText in
            XCTAssertEqual(resultText, ChepeastProduct.product2.rawValue.localized())
        }
        
        let product1ViewModel = ProductViewModel(product: Product(price: 100, amount: 100))
        let product2ViewModel = ProductViewModel(product: Product(price: 60, amount: 100))
        
        sut.compareProducts(
            product1ViewModel: product1ViewModel,
            product2ViewModel: product2ViewModel
        )
    }
    
}

private extension ResultLabelViewModelTests {
    private func generateRandomPricesAndAmountsWithOneOfThemBeenNil() -> Array<Float?> {
        let indexToBeNil = Int.random(in: 1...4)
        var randomValues = [Float?]()
        
        for index in 1...4 {
            randomValues.append(index == indexToBeNil ? nil : Float.random(in: 1...1000))
        }
        
        return randomValues
    }
    
    private func generateTwoProductsViewModels() -> (ProductViewModel, ProductViewModel) {
        let randomValues = generateRandomPricesAndAmountsWithOneOfThemBeenNil()
        
        return (
            ProductViewModel(product: Product(price: randomValues[0], amount: randomValues[1])),
            ProductViewModel(product: Product(price: randomValues[2], amount: randomValues[3]))
        )
    }
}


