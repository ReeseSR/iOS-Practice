//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController = UITabBarController()
    
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .black
    }
    
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        setup(viewController: firstViewController,
              title: "First",
              imageName: "paperplane",
              selectedImageName: "paperplane.fill")
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        setup(viewController: secondViewController,
              title: "Second",
              imageName: "moon",
              selectedImageName: "moon.fill")
        
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
    }
    
    func setup(viewController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        viewController.tabBarItem = tabBarItem
    }
    
    
    
}
