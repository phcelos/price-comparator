//
//  NotificationCenterProtocol.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 22/11/22.
//

import Foundation

protocol NotificationCenterProtocol {
    func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?)
}
