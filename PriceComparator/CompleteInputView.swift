//
//  CompleteInput.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

final class CompleteInputView: UIStackView {
    
    private let labelText: String
    private let placeHolder: String
    private let delegate: CompleteInputDelegate
    
    private lazy var label: UILabel = {
        return UILabel()
    }()
        
    private lazy var textField: UITextField = {
        return UITextField()
    }()
            
    init(labelText: String, placeHolder: String, delegate: CompleteInputDelegate) {
        self.labelText = labelText
        self.placeHolder = placeHolder
        self.delegate = delegate

        super.init(frame: .zero)
        
        setupViewHierarchy()
        setupConstraints()
        configElements()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addArrangedSubview(label)
        addArrangedSubview(textField)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        textField.heightAnchor.constraint(equalTo: label.heightAnchor).isActive = true
    }
    
    private func configElements() {
        spacing = 5
        backgroundColor = .green
        distribution = .fillEqually
        
        label.text = labelText
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .red
        
        textField.placeholder = placeHolder
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.keyboardType = .decimalPad
        textField.addTarget(self, action: #selector(didStartEditing), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(didFinishEditing), for: .editingDidEnd)

    }
    
    @objc private func didStartEditing() {
        delegate.completeInputDidStartEditing(self)
    }
    
    @objc private func didFinishEditing() {
        delegate.completeInput(self, didFinishEditingWithText: textField.text ?? "")
    }
}
