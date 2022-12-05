//
//  MainView.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 23/11/22.
//

import UIKit

final class MainView: UIView {
    
    var delegate: CompleteInputDelegate?
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Comparador de Preços"
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    var product1AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Peso produto 1: ", placeHolder: "Peso em gramas")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var product1PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Preço produto 1: ", placeHolder: "Preço")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var product2AmountInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Peso produto 2: ", placeHolder: "Peso em gramas")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var product2PriceInput: CompleteInputView = {
        let view = CompleteInputView(labelText: "Preço produto 2: ", placeHolder: "Preço")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var resultLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Resultado"
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
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
        
        mainStackView.addArrangedSubview(product1AmountInput)
        mainStackView.addArrangedSubview(product1PriceInput)
        mainStackView.addArrangedSubview(product2AmountInput)
        mainStackView.addArrangedSubview(product2PriceInput)
        mainStackView.addArrangedSubview(resultLabel)
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
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
