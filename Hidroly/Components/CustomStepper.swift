//
//  CustomStepper.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 16/06/25.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Float
    
    var body: some View {
        HStack(spacing: 16) {
            Button("-") {
                value -= 0.5
            }
            
            Button("+") {
                value += 0.5
            }
        }
        .font(.largeTitle)
        .foregroundStyle(Color.white)
    }
}
