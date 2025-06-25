//
//  CircularTextView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 24/06/25.
//

import SwiftUI

struct CircularTextView: View {
    let radius: CGFloat
    let text: String
    let angleStep: Double = 6.0

    var body: some View {
        ZStack {
            ForEach(Array(text.enumerated()), id: \.offset) { index, char in 
                let startAngle = Angle.degrees(-90 - (angleStep * Double(text.count - 1) / 2))
                let offsetAngle = Angle.degrees(angleStep * Double(index))

                let x = radius * cos(startAngle.radians + offsetAngle.radians)
                let y = -radius * sin(startAngle.radians + offsetAngle.radians)

                Text(String(char))
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                    .rotationEffect(.degrees(-90) - startAngle - offsetAngle)
                    .offset(x: x, y: y)
            }
        }
    }
}
