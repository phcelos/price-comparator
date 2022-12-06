//
//  MainViewTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 28/11/22.
//

import XCTest

@testable import PriceComparator

class MainViewTests: XCTestCase {
    func makeSUT() -> MainView {
        MainView()
    }
    
    func test_viewHierarchy() {
        let sut = makeSUT()        
        let mainStackView = sut.mainStackView
        
        XCTAssertTrue(sut.subviews.contains(sut.titleLabel))
        XCTAssertTrue(sut.subviews.contains(mainStackView))
        
        let mainStackViewSubviews = [
            sut.product1AmountInput,
            sut.product1PriceInput,
            sut.product2AmountInput,
            sut.product2PriceInput,
            sut.resultLabel
        ]
        
        for view in mainStackViewSubviews {
            XCTAssertTrue(mainStackView.subviews.contains(view))
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
