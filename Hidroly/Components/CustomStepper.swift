//
//  CustomStepper.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 16/06/25.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Double
    var step: Double

    init(value: Binding<Double>, step: Double = 1.0) {
        self._value = value
        self.step = step
    }
    
    var body: some View {
        HStack {
            Button {
                value -= step
            } label: {
                Image(systemName: "minus")
                    .foregroundStyle(Color.white)
            }
            
            Button {
                value += step
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.white)
            }
        }
    }
}
