//
//  Double+extension.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 18/01/26.
//

import Foundation

extension Double {
    var stringValue: String {
        return String(self)
    }
    
    var currencyFormatted: String {
        var isWholeNumber: Bool {
            isZero ? true: !isNormal ? false: self == rounded()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = isWholeNumber ? 0 : 2
        return formatter.string(for: self) ?? ""
    }
}
