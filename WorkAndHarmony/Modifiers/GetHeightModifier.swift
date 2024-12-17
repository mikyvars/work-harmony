//
//  GetHeightModifier.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 16/12/2024.
//

import SwiftUI

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    height = geometry.size.height
                }
                return Color.clear
            }
        )
    }
}
