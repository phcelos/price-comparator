//
//  ViewController.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 27/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product1Label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2Label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product1WeightTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2WeightTextField: UITextField = {
        let view = UITextField()
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
    
    private lazy var product1StackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var product2StackView: UIStackView = {
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
//        mainStackView.spacing = 30
        
//        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true

        product1StackView.spacing = 10
        mainStackView.addArrangedSubview(product1StackView)
        
        product2StackView.spacing = 10
        mainStackView.addArrangedSubview(product2StackView)
        
        product1Label.text = "Produto 1: "
        product1Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        product1StackView.addArrangedSubview(product1Label)
        
        product1WeightTextField.placeholder = "Digite o peso em gramas"
        product1WeightTextField.backgroundColor = .white
        product1WeightTextField.layer.cornerRadius = 10
        product1WeightTextField.keyboardType = .numberPad
        product1StackView.addArrangedSubview(product1WeightTextField)
        
        product1WeightTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        product1WeightTextField.heightAnchor.constraint(equalTo: product1Label.heightAnchor).isActive = true
        
        product2Label.text = "Produto 2: "
        product2Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        product2StackView.addArrangedSubview(product2Label)
        
        product2WeightTextField.placeholder = "Digite o peso em gramas"
        product2WeightTextField.backgroundColor = .white
        product2WeightTextField.layer.cornerRadius = 10
        product2WeightTextField.keyboardType = .numberPad
        product2StackView.addArrangedSubview(product2WeightTextField)
        
        product2WeightTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        product2WeightTextField.heightAnchor.constraint(equalTo: product1Label.heightAnchor).isActive = true
        
        resultLabel.text = "Resultado"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainStackView.addArrangedSubview(resultLabel)
    }


}
