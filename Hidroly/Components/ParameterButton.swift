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
                    // .background(Circle().fill(Color.blue))
                    .shadow(radius: 2)

                Text(manager.selectedDisplayName)
                    .font(.caption2)
            }
        }
        .position(x: position.x, y: position.y)
    }
}

