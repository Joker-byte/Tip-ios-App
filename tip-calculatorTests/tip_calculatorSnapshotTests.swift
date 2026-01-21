//
//  tip_calculatorSnapshotTests.swift
//  tip-calculatorTests
//
//  Created by Gianluca Dubioso on 21/01/26.
//

import XCTest
import SnapshotTesting
@testable import tip_calculator

final class tip_calculatorSnapshotTests: XCTestCase {
    /*
     this bool enable/disable recording screen and saving snapshots in test folder
     first time to have it run with true (test fail in saving mode,
     doesn't matter, then turn it on true or
     remove record parameters to pass test case in real mode scenario
     )
     */
    /** set on true for get all Snapshot, or make record: true for single snap*/
    
    private let saveSnapshotPngFilesToTestResources: Bool = false
    private var screenWidth: CGFloat {
        var screen: UIScreen? // for now use var
        return   screen?.bounds.size.width ?? 375
    }
    func testLogoView() {
        // given
        let size = CGSize(width: screenWidth, height: 48)
        // when
        let view = LogoView()
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    /**
     in real case of Logoview has error in named resource:
     ....
     private let topLabel: UILabel = {
     let label = UILabel()
     let text = NSMutableAttributedString(
     string: "My TIP",  ---> ex: "My TIPs" (wrong)
     attributes: [
     .font: ThemeFont.bold(ofSize: 16)
     ])
     ......
     return label
     
     //then test return failed and record give you screen with error
     */
    func testInitialResultView() {
        // given
        let size = CGSize(width: screenWidth, height: 224//check parameter to pass in CalculatorVC and given heigth to ResultView
        )
        // when
        let view = ResultView()
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    func testResultViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(amountPerPerson: 100.50,
                            totalBill: 50,
                            totalTip: 60)
        //this values are not important if arbitrary,needed for see snapshot of result view with customs value
        // when
        let view = ResultView()
        view.configure(result: result)
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    
    
    
    func testInitialBillInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    func testBillInputViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        let textField = view.allSubviewsOf(type: UITextField.self).first
        textField?.text = "500"
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    
    func testInitialTipInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = TipInputView()
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    func testTipInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = TipInputView()
        let button = view.allSubviewsOf(type: UIButton.self).first// ten percent
        button?.sendActions(for: .touchUpInside)
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    func testInitialSplitInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = SplitInputView()
        // then
        
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    func testSplitInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = SplitInputView()
        //let button = view.allSubviewsOf(type: UIButton.self).last // + 1
        let button = view.allSubviewsOf(type: UIButton.self).first// -1
        button?.sendActions(for: .touchUpInside)
        // then
        assertSnapshot(of: view, as: .image(size: size), record: saveSnapshotPngFilesToTestResources)
    }
    
}
extension UIView {
    //https://stackoverflow.com/a/45297466/6181721
    /** This is the function to get subViews of a view of a particular type */
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    /** This is a function to get subViews of a particular type from view recursively.
     It would look recursively in all subviews and return back the subviews of the type T */
    func allSubviewsOf<T : UIView>(type : T.Type) -> [T] {
        var all: [T] = []
        func getSubView(view: UIView) {
            if let view = view as? T {
                all.append(view)
            }
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach({ getSubView(view: $0) })
        }
        getSubView(view: self)
        return all
    }
    /** USAGE :
     let allSubviews = view.allSubViewsOf(type: UIView.self)
     let allLabels = view.allSubViewsOf(type: UILabel.self)
     */
}
