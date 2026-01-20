//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 16/01/26.
//
import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
