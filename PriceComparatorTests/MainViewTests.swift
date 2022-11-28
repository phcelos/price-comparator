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
        let mainView = makeSUT()        
        let mainStackView = mainView.mainStackView
        
        XCTAssertTrue(mainView.subviews.contains(mainView.titleLabel))
        XCTAssertTrue(mainView.subviews.contains(mainStackView))
        
        let mainStackViewSubviews = [
            mainView.product1AmountInput,
            mainView.product1PriceInput,
            mainView.product2AmountInput,
            mainView.product2PriceInput,
            mainView.resultLabel
        ]
        
        for view in mainStackViewSubviews {
            XCTAssertTrue(mainStackView.subviews.contains(view))
        }
    }
}
