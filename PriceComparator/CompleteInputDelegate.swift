//
//  CompleteInputDelegate.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

protocol CompleteInputDelegate {
    func completeInputDidStartEditing(_ completeInput: CompleteInputView)
    func completeInput(_ completeInput: CompleteInputView, didFinishEditingWithText text: String)
}
