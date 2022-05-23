//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneResquested: () -> ()
    
    var body: some View {
        TabView {
            ScaledImageView(name: "cat")
                .tag(0)
            ScaledImageView(name: "dog")
                .tag(1)
            ScaledImageView(name: "hedgehog")
                .tag(2)
            
            Button("Done") {
                doneResquested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black.ignoresSafeArea(.all))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneResquested: { })
    }
}
