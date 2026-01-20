//
//  HeaderView.swift
//  tip-calculator
//
//  Created by Gianluca Dubioso on 15/01/26.
//

import UIKit
import SnapKit

class HeaderView : UIView {
    
    private let topLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.bold(ofSize: 18)
        )
    }()
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: "nil",
            font: ThemeFont.regular(ofSize: 16)
        )
    }()
    
    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var vStackView : UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                topSpacerView,
                topLabel,
                bottomLabel,
                bottomSpacerView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        //stackView.distribution = .fillEqually
        stackView.spacing = -4
        return stackView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        topSpacerView.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacerView)
        }
    }
    
    func configure(topText: String, bottomText: String){
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
    
}


