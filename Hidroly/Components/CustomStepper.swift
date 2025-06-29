//
//  CustomStepper.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 16/06/25.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Double
    var step = 1.0
    
    var body: some View {
        HStack {
            Button {
                value -= 0.5
            } label: {
                Image(systemName: "minus")
                    .foregroundStyle(Color.white)
            }
            
            Button {
                value += 0.5
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.white)
            }
        }
    }
}
