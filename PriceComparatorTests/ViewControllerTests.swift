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
    
    func test_whenViewControllerIsInitialized_thenCompleteInputViewsDelegatesAreSet() {
        let sut = makeSUT()
        
        XCTAssertIdentical(sut.product1AmountInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product2AmountInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product1PriceInput.delegate as AnyObject, sut)
        XCTAssertIdentical(sut.product2PriceInput.delegate as AnyObject, sut)
    }
    
    func test_completeInputDidStartEditing_setsActiveCompleteInput() {
        let sut = makeSUT()
        let completeInput = sut.product1AmountInput
        
        sut.completeInputDidStartEditing(completeInput)
        
        XCTAssertIdentical(sut.activeCompleteInput, completeInput)
    }
    
    func test_completeInputDidFinishEditingWithText_updatesResultLabel() {
        let sut = makeSUT()
        
        sut.completeInput(sut.product1AmountInput, didFinishEditingWithText: "100")
        XCTAssertEqual(sut.resultLabel.text, "Resultado", "product1AmountInput")

        sut.completeInput(sut.product2AmountInput, didFinishEditingWithText: "200")
        XCTAssertEqual(sut.resultLabel.text, "Resultado", "product2AmountInput")
        
        sut.completeInput(sut.product1PriceInput, didFinishEditingWithText: "10")
        XCTAssertEqual(sut.resultLabel.text, "Resultado", "product1PriceInput")
        
        sut.completeInput(sut.product2PriceInput, didFinishEditingWithText: "30")
        XCTAssertEqual(sut.resultLabel.text, ChepeastProduct.product1.rawValue)
        
        sut.completeInput(sut.product1PriceInput, didFinishEditingWithText: "")
        XCTAssertEqual(sut.resultLabel.text, "Resultado", "product1PriceInput should be empty")
    }
}



