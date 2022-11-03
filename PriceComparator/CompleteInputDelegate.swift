//
//  CompleteInputDelegate.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 03/11/22.
//

import UIKit

protocol CompleteInputDelegate {
    func completeInput(_ completeInput: CompleteInput, didFinishEditingWithText text: String)
}
