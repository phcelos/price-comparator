//
//  ViewControllerTests.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 10/11/22.
//

import XCTest

@testable import PriceComparator

class ViewControllerTests: XCTestCase {
    private lazy var notificationCenterSpy = NotificationCenterSpy()
    
    func makeSUT() -> ViewController {
        ViewController(notificationCenter: notificationCenterSpy)
    }
    
    func test_viewDidLoad_setsBackgroundColor() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func test_viewDidLoad_setupViewHierarchy() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
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
    
    func test_viewDidLoad_setsKeyboardEvents() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(notificationCenterSpy.addObserverCount, 2)
        
        let observersPassed = notificationCenterSpy.addObserverObserversPassed as? [ViewController]
        XCTAssertEqual(observersPassed, [sut, sut])
        
        let namesPassed = notificationCenterSpy.addObserverNamesPassed
        let namesExpected = [UIResponder.keyboardWillShowNotification, UIResponder.keyboardWillHideNotification]
        XCTAssertEqual(namesPassed, namesExpected)
    }
}



