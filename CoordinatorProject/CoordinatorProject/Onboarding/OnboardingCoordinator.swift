//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import Foundation
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    
    var rootViewController = UIViewController()
  
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    // Onboarding 종료 시 state 바꿀 수 있게됨
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }

}
