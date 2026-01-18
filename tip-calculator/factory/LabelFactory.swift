//
//  LabelFactory.swift
//  tip-calculator
//
//  Created by gdubioso dubioso on 14/01/26.
//

import UIKit

struct LabelFactory {
    
    static func build(
        text: String?,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = ThemeColor.text,
        textAligment: NSTextAlignment = .center
        
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColor
        label.textAlignment = textAligment
        label.textColor = textColor
        return label
    }

}
