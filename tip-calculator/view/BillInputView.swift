//
//  BillInputView.swift
//  tip-calculator
//
//  Created by gdubioso dubioso on 14/01/26.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa
//CombineCocoa: Creates the interface to listen the event that happening inside UI components


class BillInputView : UIView {
    
//    private let headerView: HeaderView = {
//        return HeaderView()
//
//    }()
//    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Enter", bottomText: "your bill")
        return view
    }()
    
    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8)
        return view
    }()
    
    private let currencyDominationLabel: UILabel = {
        let label = LabelFactory.build(
            text: "$",
            font: ThemeFont.bold(ofSize: 24)
        )
        label .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = ThemeFont.bold(ofSize: 24)
        textField.borderStyle = .none
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.tintColor = ThemeColor.text
        textField.textColor = ThemeColor.text
        // Add toolbar
        let toolBar = UIToolbar(
            frame: CGRect(x: 0, y: 0,
                          width: frame.size.width,
                          height: 36)
        )
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped)
        )
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil
                           ),
            doneButton
        ]
//        toolbar.setItems([doneButton], animated: false)
//        textField.inputAccessoryView = toolbar
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        return textField
    }()
    
    private var privateText: String?
    //----> expose private text
    /*
    var publishText: String? {
        return privateText
    }
    */
    private let billSubject: PassthroughSubject<Double, Never> = .init()
    
    var valuePublisher: AnyPublisher<Double, Never> {
        return billSubject.eraseToAnyPublisher()
    }
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        super.init(frame: .zero)
        layout()
        observe()
    }
    
    func reset() {
        textField.text = nil
        billSubject.send(0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func observe() {
        textField.textPublisher.sink { [unowned self] text in
            
          //-->   privateText = text --> assign text to a private text and exposed outside by publishtext
            
            billSubject.send(text?.doubleValue ?? 0)
            print("Text: \(String(describing: text))")
            
        }.store(in: &cancellables)
    }
    
    private func layout () {
        
        [headerView, textFieldContainerView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
//            make.height.equalTo(24)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        textFieldContainerView.addSubview(currencyDominationLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyDominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
       // backgroundColor = .gray
    }
    
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
        
    }
}

