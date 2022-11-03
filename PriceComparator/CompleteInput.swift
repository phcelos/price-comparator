//
//  CompleteInput.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

final class CompleteInput: UIStackView {
    
    private let labelText: String
    private let placeHolder: String
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    init(labelText: String, placeHolder: String) {
        self.labelText = labelText
        self.placeHolder = placeHolder
        
        super.init(frame: .zero)
        
        setupViewHierarchy()
        setupConstraints()
        configElements()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addArrangedSubview(label)
        addArrangedSubview(textField)
    }
    
    private func setupConstraints() {
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        textField.keyboardType = .numberPad
    }
}
