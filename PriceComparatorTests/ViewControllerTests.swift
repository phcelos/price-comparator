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
        
        let mainView = sut.mainView
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
        sut.loadViewIfNeeded()

        let mainView = sut.mainView

        XCTAssertIdentical(mainView.product1AmountInput.delegate as AnyObject, mainView)
        XCTAssertIdentical(mainView.product2AmountInput.delegate as AnyObject, mainView)
        XCTAssertIdentical(mainView.product1PriceInput.delegate as AnyObject, mainView)
        XCTAssertIdentical(mainView.product2PriceInput.delegate as AnyObject, mainView)
        
        XCTAssertIdentical(mainView.delegate as AnyObject, sut)
    }
    
    func test_completeInputDidStartEditing_setsActiveCompleteInput() {
        let sut = makeSUT()
        let mainView = sut.mainView

        let completeInput = mainView.product1AmountInput
        
        sut.completeInputDidStartEditing(completeInput)
        
        XCTAssertIdentical(sut.activeCompleteInput, completeInput)
    }
    
    func test_completeInputDidFinishEditingWithText_updatesResultLabel() {
        let sut = makeSUT()
        let mainView = sut.mainView

        sut.completeInput(mainView.product1AmountInput, didFinishEditingWithText: "100")
        XCTAssertEqual(mainView.resultLabel.text, "Resultado", "product1AmountInput")

        sut.completeInput(mainView.product2AmountInput, didFinishEditingWithText: "200")
        XCTAssertEqual(mainView.resultLabel.text, "Resultado", "product2AmountInput")
        
        sut.completeInput(mainView.product1PriceInput, didFinishEditingWithText: "10")
        XCTAssertEqual(mainView.resultLabel.text, "Resultado", "product1PriceInput")
        
        sut.completeInput(mainView.product2PriceInput, didFinishEditingWithText: "30")
        XCTAssertEqual(mainView.resultLabel.text, ChepeastProduct.product1.rawValue)
        
        sut.completeInput(mainView.product1PriceInput, didFinishEditingWithText: "")
        XCTAssertEqual(mainView.resultLabel.text, "Resultado", "product1PriceInput should be empty")
    }
}



