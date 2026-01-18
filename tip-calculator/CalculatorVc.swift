//
//  ViewController.swift
//  tip-calculator
//
//  Created by gdubioso dubioso on 14/01/26.
//

import UIKit
import SnapKit

class CalculatorVc: UIViewController {
    
    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()//add view fixing layuout errors in debug
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        
        
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .yellow
        
        
        layout()
    }

    func layout() {
        view.backgroundColor = ThemeColor.bg
        view.addSubview(vStackView)
        
        vStackView.snp.makeConstraints { make in
            
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+15)
        }
        
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        
    }

}

