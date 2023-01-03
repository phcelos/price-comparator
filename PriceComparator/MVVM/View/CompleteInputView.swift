//
//  CompleteInput.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

protocol CompleteInputDelegate: AnyObject {
    func completeInputDidStartEditing(_ completeInput: CompleteInputView)
    func completeInput(_ completeInput: CompleteInputView, didFinishEditingWithText text: String)
}

final class CompleteInputView: UIStackView {
    
    private let labelText: String
    private let placeHolder: String
    weak var delegate: CompleteInputDelegate?
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = labelText
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
        
    lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = placeHolder
        view.borderStyle = .roundedRect
        view.keyboardType = .decimalPad
        view.addTarget(self, action: #selector(didStartEditing), for: .editingDidBegin)
        view.addTarget(self, action: #selector(didFinishEditing), for: .editingDidEnd)
        
        return view
    }()
            
    init(labelText: String, placeHolder: String) {
        self.labelText = labelText
        self.placeHolder = placeHolder

        super.init(frame: .zero)
        
        setupViewHierarchy()
        setupConstraints()
        setupView()
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
    
    private func setupView() {
        spacing = 5
        distribution = .fillEqually
    }
    
    @objc private func didStartEditing() {
        delegate?.completeInputDidStartEditing(self)
    }
    
    @objc private func didFinishEditing() {
        delegate?.completeInput(self, didFinishEditingWithText: textField.text ?? "")
    }
}
