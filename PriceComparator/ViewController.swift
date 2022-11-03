//
//  ViewController.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 27/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var product1Amount: Float?
    private var product1Price: Float?
    private var product2Amount: Float?
    private var product2Price: Float?
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product1AmountInput: CompleteInput = {
        let view = CompleteInput(labelText: "Peso produto 1: ", placeHolder: "Peso em gramas", target: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product1PriceInput: CompleteInput = {
        let view = CompleteInput(labelText: "Preço produto 1: ", placeHolder: "Preço", target: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2AmountInput: CompleteInput = {
        let view = CompleteInput(labelText: "Peso produto 2: ", placeHolder: "Peso em gramas", target: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2PriceInput: CompleteInput = {
        let view = CompleteInput(labelText: "Peso produto 2: ", placeHolder: "Preço", target: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var resultLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        titleLabel.text = "Comparador de Preços"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)

        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        mainStackView.backgroundColor = .blue
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .equalSpacing

        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true

        mainStackView.addArrangedSubview(product1AmountInput)
        mainStackView.addArrangedSubview(product1PriceInput)
        mainStackView.addArrangedSubview(product2AmountInput)
        mainStackView.addArrangedSubview(product2PriceInput)
                
        resultLabel.text = "Resultado"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainStackView.addArrangedSubview(resultLabel)
    }
    
    func updateResultLabel(chepeastProduct: ChepeastProduct?) {
        if let chepeastProduct = chepeastProduct {
            switch chepeastProduct {
            case .none:
                resultLabel.text = "Mesmo preço."
            default:
                resultLabel.text = "O produto mais barato é o \(chepeastProduct.rawValue)."
            }
        } else {
            resultLabel.text = "Resultado."
        }
    }
}

extension ViewController: CompleteInputDelegate {
    func completeInput(_ completeInput: CompleteInput, didFinishEditingWithText text: String) {
        let insertedValue = Float(text)
        
        switch completeInput {
        case product1AmountInput:
            product1Amount = insertedValue
        case product1PriceInput:
            product1Price = insertedValue
        case product2AmountInput:
            product2Amount = insertedValue
        case product2PriceInput:
            product2Price = insertedValue
        default:
            return
        }
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            amount1InGrams: product1Amount, price1: product1Price,
            amount2InGrams: product2Amount, price2: product2Price)
        
        updateResultLabel(chepeastProduct: chepeastProduct)
    }
}
