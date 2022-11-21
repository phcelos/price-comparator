//
//  ViewControllerTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 10/11/22.
//

import XCTest

@testable import PriceComparator

class ViewControllerTests: XCTestCase {
    func makeSUT() -> ViewController {
        let sut = ViewController()
        return sut
    }
    
    func test_viewDidLoad_setsBackgroundColor() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func test_viewDidLoad_setupViewHierarchy() {
        let sut = makeSUT()
        let mainStackView = sut.mainStackView
        
        XCTAssertTrue(sut.view.subviews.contains(sut.titleLabel))
        XCTAssertTrue(sut.view.subviews.contains(mainStackView))
        
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
}

