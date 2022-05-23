//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by 배소린 on 2022/05/23.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
