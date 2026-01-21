//
//  ScreenIdentifier.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 21/01/26.
//

import Foundation

enum ScreenIdentifier {
    
    enum LogoView: String{
        case LogoView
        
    }
    
    enum ResultView: String {
        case totalAmountPerPersonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }
  
    enum BillInputView: String {
        case textField
    }
    
    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercentButton
        case twentyPercentButton
        case customTipButton
    }
    
    enum SplitInputView: String {
        case decrementButton
        case incrementButton
        case quantityValueLabel
    }
}
