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
    
    func test_whenViewDidLoad_addsMainViewAsSubview() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.view.subviews.contains(sut.mainView))
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
    
    func test_whenViewControllerIsInitialized_thenMainViewDelegateIsSet() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()

        let mainView = sut.mainView
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
        sut.loadViewIfNeeded()

        let mainView = sut.mainView
        let defaultResultLabelText = "-"
        
        sut.completeInput(mainView.product1AmountInput, didFinishEditingWithText: "100")
        XCTAssertEqual(mainView.resultLabel.text, defaultResultLabelText, "product1AmountInput")

        sut.completeInput(mainView.product2AmountInput, didFinishEditingWithText: "200")
        XCTAssertEqual(mainView.resultLabel.text, defaultResultLabelText, "product2AmountInput")
        
        sut.completeInput(mainView.product1PriceInput, didFinishEditingWithText: "10")
        XCTAssertEqual(mainView.resultLabel.text, defaultResultLabelText, "product1PriceInput")
        
        sut.completeInput(mainView.product2PriceInput, didFinishEditingWithText: "30")
        XCTAssertEqual(mainView.resultLabel.text, ChepeastProduct.product1.rawValue.localized())
        
        sut.completeInput(mainView.product1PriceInput, didFinishEditingWithText: "")
        XCTAssertEqual(mainView.resultLabel.text, defaultResultLabelText, "product1PriceInput should be empty")
    }
}



