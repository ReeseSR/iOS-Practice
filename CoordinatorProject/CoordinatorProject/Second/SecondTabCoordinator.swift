//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import Foundation
import UIKit

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController:SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
