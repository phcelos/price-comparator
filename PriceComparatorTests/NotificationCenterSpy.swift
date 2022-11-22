//
//  NotificationCenterSpy.swift
//  PriceComparatorTests
//
//  Created by Paulo Henrique on 22/11/22.
//

@testable import PriceComparator

import Foundation

class NotificationCenterSpy: NotificationCenterProtocol {
    
    var addObserverCount = 0
    var addObserverObserversPassed = [Any?]()
    var addObserverSelectorsPassed = [Selector?]()
    var addObserverNamesPassed = [NSNotification.Name?]()
    var addObserverObjectsPassed = [Any?]()
    
    func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        addObserverCount += 1
        
        addObserverObserversPassed.append(observer)
        addObserverSelectorsPassed.append(aSelector)
        addObserverNamesPassed.append(aName)
        addObserverObjectsPassed.append(anObject)
    }
}
