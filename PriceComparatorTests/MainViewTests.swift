//
//  MainViewTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 28/11/22.
//

import XCTest

@testable import PriceComparator

final class MainViewTests: XCTestCase {
    func makeSUT() -> MainView {
        MainView()
    }
    
    func test_viewHierarchy() {
        let sut = makeSUT()        
        let mainStackView = sut.mainStackView
        let product1StackView = sut.product1StackView
        let product2StackView = sut.product2StackView
        
        XCTAssertTrue(sut.subviews.contains(sut.titleLabel))
        XCTAssertTrue(sut.subviews.contains(mainStackView))
        
        let mainStackViewSubviews = [
            product1StackView,
            product2StackView,
            sut.resultLabel
        ]
        
        for view in mainStackViewSubviews {
            XCTAssertTrue(mainStackView.subviews.contains(view))
        }
        
        let product1StackViewSubviews = [
            sut.product1AmountInput,
            sut.product1PriceInput
        ]
        
        for view in product1StackViewSubviews {
            XCTAssertTrue(product1StackView.subviews.contains(view))
        }
        let product2StackViewSubviews = [
            sut.product2AmountInput,
            sut.product2PriceInput
        ]
        
        for view in product2StackViewSubviews {
            XCTAssertTrue(product2StackView.subviews.contains(view))
        }
    }
    
    func test_whenViewControllerIsInitialized_thenCompleteInputViewsDelegatesAreSet() {
        let viewController = ViewController()
        viewController.loadViewIfNeeded()
        
        let sut = viewController.mainView
        
        XCTAssertIdentical(sut.product1AmountInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product2AmountInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product1PriceInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product2PriceInput.delegate as AnyObject, sut)        
    }
}
