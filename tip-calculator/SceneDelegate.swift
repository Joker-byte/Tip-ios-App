//
//  SceneDelegate.swift
//  tip-calculator
//
//  Created by gdubioso dubioso on 14/01/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
                let window = UIWindow(windowScene: windowScene)
                let vc = CalculatorVc()
                window.rootViewController = vc
                self.window = window
                window.makeKeyAndVisible()
    }



}

