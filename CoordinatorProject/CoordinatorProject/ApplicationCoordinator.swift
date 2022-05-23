//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import SwiftUI
import UIKit
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window:UIWindow
    
    var childCoordinators = [Coordinator]()
    
    // publishes Boolean, never fail
    // 유저가 onboarding 보지 않았다 가정
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        setupOnboardingValue()
        // false인데도 false 보내는 등 이미 값 동일할 경우
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
                
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
                
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        
        // storing and loading of state
        
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 })
            .sink{ (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }.store(in: &subscriptions)
        
    }
    
    
}
