//
//  ViewController.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 27/10/22.
//

import UIKit

final class ViewController: UIViewController, KeyboardOwner {
    
    private let notificationCenter: NotificationCenterProtocol
    private var product1ViewModel = ProductViewModel(product: Product())
    private var product2ViewModel = ProductViewModel(product: Product())
    private var resultLabelViewModel = ResultLabelViewModel()
    
    let mainView = MainView(frame: .zero)
    
    var activeTextField: UITextField?
    
    init(notificationCenter: NotificationCenterProtocol = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
        
        setupView()
        setupConstraints()
        setupResultLabelViewModel()
        setupKeyboardEvents()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private func setupResultLabelViewModel() {
        resultLabelViewModel.updateResultLabel = { [weak self] resultText in
            self?.mainView.resultLabel.text = resultText
        }
    }

    private func setupKeyboardEvents() {
        activateHideKeyboardWhenTappedAroundBehavior()
        activateMoveViewUpWhenTextFieldIsCoveredByKeyboardBehavior(notificationCenter: notificationCenter)
    }

}

extension ViewController: CompleteInputDelegate {
    func completeInputDidStartEditing(_ completeInput: CompleteInputView) {
        activeTextField = completeInput.textField
    }
    
    func completeInput(_ completeInput: CompleteInputView, didFinishEditingWithText text: String) {
        let insertedValue = Float(text)
        
        switch completeInput {
        case mainView.product1AmountInput:
            product1ViewModel.amount = insertedValue
        case mainView.product1PriceInput:
            product1ViewModel.price = insertedValue
        case mainView.product2AmountInput:
            product2ViewModel.amount = insertedValue
        case mainView.product2PriceInput:
            product2ViewModel.price = insertedValue
        default:
            return
        }
        
        resultLabelViewModel.compareProducts(
            product1ViewModel: product1ViewModel,
            product2ViewModel: product2ViewModel
        )
    }
}

