//
//  TextFieldProtocol.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

protocol TextFieldDelegate {
    func textField(_ textField: UITextField, didFinishEditingWithText text: String)
}
