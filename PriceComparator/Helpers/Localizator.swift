//
//  Localizator.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 23/12/22.
//

import Foundation

class Localizator {
    static func getLocalizedStringForKey(_ key: String) -> String {
        let value = NSLocalizedString(key, comment: "")
        if value != key || NSLocale.preferredLanguages.first == "en" {
            return value
        }
        
        // Fall back to en
        guard
            let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return value }
        
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}
