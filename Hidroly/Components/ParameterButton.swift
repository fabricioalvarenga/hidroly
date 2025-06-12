//
//  ParameterButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

struct ParameterButton: View {
    let manager: any AnyParameterManager
    let position: CGPoint
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                manager.icon
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(alignment: .leading) {
                        Circle()
                            .fill(Color.blue.gradient)
                    }
                    .shadow(radius: 2)

                Text(manager.selectedDisplayName)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 5)
                    .frame(maxWidth: 80)
                    .minimumScaleFactor(0.8)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .position(x: position.x, y: position.y)
    }
}

