//
//  ParameterButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

struct ParameterButton: View {
    let manager: any AnyParameterManager
    var position: CGPoint?
    let action: () -> Void

   var body: some View {
        VStack {
            Button(action: action) {
                manager.icon
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(alignment: .leading) {
                        Circle()
                            .fill(manager.itemSelected ? Color.blue.gradient : Color.red.gradient)
                    }
                    .shadow(radius: 2)
            }

            Text(manager.title)
                .font(.caption2)
                .foregroundStyle(Color.blue)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: 80)
                .minimumScaleFactor(0.8)
                .fixedSize(horizontal: false, vertical: true)
           
        }
        .animation(.easeInOut(duration: 0.3), value: manager.selectedDisplayName)
   }
}
