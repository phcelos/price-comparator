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
}
