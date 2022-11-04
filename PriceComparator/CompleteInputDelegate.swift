//
//  CompleteInputDelegate.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

protocol CompleteInputDelegate {
    func completeInputDidStartEditing(_ completeInput: CompleteInput)
    func completeInput(_ completeInput: CompleteInput, didFinishEditingWithText text: String)
}
