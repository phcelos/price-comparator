//
//  ViewController.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 27/10/22.
//

import UIKit

final class ViewController: UIViewController {
    
    private let SPACING_BETWEEN_KEYBOARD_AND_TEXT_FIELD: CGFloat = 10
    
    private var product1 = Product()
    private var product2 = Product()
    
    private var activeCompleteInput: CompleteInputView?
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Comparador de Preços"
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    private lazy var product1AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Peso produto 1: ", placeHolder: "Peso em gramas", delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product1PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Preço produto 1: ", placeHolder: "Preço", delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Peso produto 2: ", placeHolder: "Peso em gramas", delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Preço produto 2: ", placeHolder: "Preço", delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Resultado"
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        setupViewHierarchy()
        setupConstraints()
        setupKeyboardEvents()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(product1AmountInput)
        mainStackView.addArrangedSubview(product1PriceInput)
        mainStackView.addArrangedSubview(product2AmountInput)
        mainStackView.addArrangedSubview(product2PriceInput)
        mainStackView.addArrangedSubview(resultLabel)
    }
    
    private func setupConstraints() {
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private func setupKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func updateResultLabel(chepeastProduct: ChepeastProduct?) {
        resultLabel.text = chepeastProduct?.rawValue ?? "Resultado"
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
            view.frame.origin.y = topOfKeyboard - bottomOfTextField - SPACING_BETWEEN_KEYBOARD_AND_TEXT_FIELD
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
        case product1AmountInput:
            product1.amount = insertedValue
        case product1PriceInput:
            product1.price = insertedValue
        case product2AmountInput:
            product2.amount = insertedValue
        case product2PriceInput:
            product2.price = insertedValue
        default:
            return
        }
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            product1: product1, product2: product2)
        
        updateResultLabel(chepeastProduct: chepeastProduct)
    }
}
