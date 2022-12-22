//
//  ViewController.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 27/10/22.
//

import UIKit

final class ViewController: UIViewController {
    
    private let spacingBetweenKeyboardAndTextField: CGFloat = 10
    
    private let notificationCenter: NotificationCenterProtocol
    private var product1ViewModel = ProductViewModel(product: Product())
    private var product2ViewModel = ProductViewModel(product: Product())
    
    let mainView = MainView(frame: .zero)
    
    var activeCompleteInput: CompleteInputView?
    
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
        setupKeyboardEvents()
    }
    
    private func setupView() {
        view.backgroundColor = .purple
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }

    private func setupKeyboardEvents() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func updateResultLabel(chepeastProduct: ChepeastProduct?) {
        mainView.resultLabel.text = chepeastProduct?.rawValue ?? "Resultado"
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard
            let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let activeCompleteInput = activeCompleteInput
        else {
            return
        }
        
        let bottomOfTextField = activeCompleteInput.convert(activeCompleteInput.bounds, to: view).maxY
        
        let topOfKeyboard = view.frame.height - keyboardSize.height
        
        // if the bottom of Textfield is below the top of keyboard, move up
        if bottomOfTextField > topOfKeyboard {
            view.frame.origin.y = topOfKeyboard - bottomOfTextField - spacingBetweenKeyboardAndTextField
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

extension ViewController: CompleteInputDelegate {
    func completeInputDidStartEditing(_ completeInput: CompleteInputView) {
        activeCompleteInput = completeInput
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
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            product1: product1ViewModel.product, product2: product2ViewModel.product)
        
        updateResultLabel(chepeastProduct: chepeastProduct)
    }
}
