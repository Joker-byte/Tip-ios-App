//
//  Double+extension.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 18/01/26.
//

import Foundation

extension Double {
    var currencyFormatted: String {
        var isWholeNumber: Bool {
            isZero ? true: !isNormal ? false: self == rounded()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.minimumFractionDigits = isWholeNumber ? 0 : 2
        return formatter.string(for: self) ?? ""
    }
}
/*
 
 let amount = 1234.56
 let formatter = NumberFormatter()
 formatter.numberStyle = .currency
 formatter.locale = Locale(identifier: "en_US") // Sets the currency symbol and grouping
 // formatter.maximumFractionDigits = 2 // Optional: Limit decimals

 let formattedString = formatter.string(from: NSNumber(value: amount))
 // formattedString will be "$1,234.56"
 
 */
