//
//  MainView.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 23/11/22.
//

import UIKit

final class MainView: UIView {
    
    weak var delegate: CompleteInputDelegate?
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "title.label".localized()
        view.font = UIFont.boldSystemFont(ofSize: 27)
        return view
    }()
    
    let product1Label: UILabel = {
        return createProductLabelWithText("product1.label".localized())
    }()
    
    let product1AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "weight.label".localized(), placeHolder: "weightInGrams.placeholder".localized())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let product1PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "price.label".localized(), placeHolder: "price.placeholder".localized())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let product2Label: UILabel = {
        return createProductLabelWithText("product2.label".localized())
    }()
    
    let product2AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "weight.label".localized(), placeHolder: "weightInGrams.placeholder".localized())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let product2PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "price.label".localized(), placeHolder: "price.placeholder".localized())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resultLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "-"
        view.font = UIFont.boldSystemFont(ofSize: 23)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    let mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    
    let product1StackView: UIStackView = {
        return createProductStackView()

    }()
    
    let product2StackView: UIStackView = {
        return createProductStackView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewsDelegates()
        setupViewHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewsDelegates() {
        product1AmountInput.delegate = self
        product1PriceInput.delegate = self
        product2AmountInput.delegate = self
        product2PriceInput.delegate = self
    }
    
    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(product1StackView)
        mainStackView.addArrangedSubview(product2StackView)
        mainStackView.addArrangedSubview(resultLabel)

        product1StackView.addArrangedSubview(product1Label)
        product1StackView.addArrangedSubview(product1AmountInput)
        product1StackView.addArrangedSubview(product1PriceInput)
        
        product2StackView.addArrangedSubview(product2Label)
        product2StackView.addArrangedSubview(product2AmountInput)
        product2StackView.addArrangedSubview(product2PriceInput)
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        let mainStackViewWidth = mainStackView.widthAnchor
        product1StackView.widthAnchor.constraint(equalTo: mainStackViewWidth).isActive = true
        product2StackView.widthAnchor.constraint(equalTo: mainStackViewWidth).isActive = true
        
        let product1StackViewWidth = product1StackView.widthAnchor
        product1AmountInput.widthAnchor.constraint(equalTo: product1StackViewWidth, constant: -20).isActive = true
        product1PriceInput.widthAnchor.constraint(equalTo: product1StackViewWidth, constant: -20).isActive = true
        
        let product2StackViewWidth = product2StackView.widthAnchor
        product2AmountInput.widthAnchor.constraint(equalTo: product2StackViewWidth, constant: -20).isActive = true
        product2PriceInput.widthAnchor.constraint(equalTo: product2StackViewWidth, constant: -20).isActive = true

    }
    
    private static func createProductStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }
    
    private static func createProductLabelWithText(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

extension MainView: CompleteInputDelegate {
    func completeInputDidStartEditing(_ completeInput: CompleteInputView) {
        delegate?.completeInputDidStartEditing(completeInput)
    }
    
    func completeInput(_ completeInput: CompleteInputView, didFinishEditingWithText text: String) {
        delegate?.completeInput(completeInput, didFinishEditingWithText: text)
    }
}
