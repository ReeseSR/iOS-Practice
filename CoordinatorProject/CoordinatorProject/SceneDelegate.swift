//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var applicationCoordinator: ApplicationCoordinator?

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.applicationCoordinator = applicationCoordinator
            // start the window -> makes the key + make it visible
            window.makeKeyAndVisible()
        } else {
            return
        }
    }
}

