//
//  CalculatorVM.swift
//  tip-calculator
//
//  Created by gdubioso dubioso on 16/01/26.
//

import Foundation
import Combine

class CalculatorVM {
    
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
// let updateViewPublisher: AnyPublisher<(Double, Double, Double)>
       let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func transform(input: Input) -> Output {
        
        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.tipPublisher,
            input.splitPublisher).flatMap { [unowned self] (bill, tip, split) in
            let totalTip = getTipAmount(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let amountPerPerson: Double = totalBill / Double(split)

        
         let result = Result(
                amountPerPerson: amountPerPerson,
                totalBill: totalBill,
                totalTip: totalTip)
            return Just(result)
        }.eraseToAnyPublisher()
        return Output(updateViewPublisher: updateViewPublisher)
/*
        //---> test for single publisher
        
        input.billPublisher.sink { bill in
            print("bill: \(bill)")
        }.store(in: &cancellables)

        input.tipPublisher.sink { tip in
            print("the tip: \(tip)")
        }.store(in: &cancellables)
        
        input.splitPublisher.sink { split in
            print("the split: \(split)")
        }.store(in: &cancellables)

        let result = Result(
            amountPerPerson: 500,
            totalBill: 1000,
            totalTip: 50.0)
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
*/
//      <----
    }
    
    private func getTipAmount(bill: Double, tip: Tip) -> Double {
        switch tip {
        case .none:
            return 0
        case .tenPercent:
            return bill * 0.1
        case .fifteenPercent:
            return bill * 0.15
        case .twentyPercent:
            return bill * 0.2
        case .custom(let value):
          return Double(value)
        }
    }
    
}


struct Result {
    let amountPerPerson: Double
    let totalBill: Double
    let totalTip: Double
    
}
