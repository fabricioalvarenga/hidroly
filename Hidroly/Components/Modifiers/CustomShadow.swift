//
//  CustomShadow.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 17/06/25.
//

import SwiftUI

struct CustomShadow<T: InsettableShape>: ViewModifier {
    let color: Color
    let opacity: Double
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    let shape: T

    func body(content: Content) -> some View {
        content
            .background(
                .background
                    .shadow(.drop(color: color.opacity(opacity), radius: radius, x: x, y: y)),
                    // .shadow(.drop(color: color.opacity(opacity - 0.02), radius: radius, x: -x, y: -y)),
                in: shape
            )
    }
}

extension View {
    func customShadow<T: InsettableShape>(color: Color = .black, opacity: Double = 0.2, radius: CGFloat = 5, x: CGFloat = 5, y: CGFloat = 5, in shape: T) -> some View {
        modifier(CustomShadow(color: color, opacity: opacity, radius: radius, x: x, y: y, shape: shape))
    }
}
