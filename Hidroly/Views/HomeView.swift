//
//  HomeView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/05/25.
//
import SwiftUI

struct HomeView: View {
    @State private var intakeProgress = 0.5
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        GeometryReader { geometry in 
            let size = min(geometry.size.width, geometry.size.height)
            let radius = size / 2.0
            let offset = 60.0

            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)

                Circle()
                .trim(from: 0.0, to: intakeProgress)
                .stroke(AngularGradient(colors: [.blue, .cyan],
                                        center: .center,
                                        startAngle: Angle(degrees: 0),
                                        endAngle: Angle(degrees: 360 * intakeProgress)),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                Text("\(Int(intakeProgress * 100))%")
                    .font(.largeTitle)
                    .bold()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)

                let count = Double(viewModel.parameterManagers.count)
                ForEach(viewModel.parameterManagers.indices, id: \.self) { index in
                    let angle = Angle.degrees(360.0 / count * Double(index))

                    let x = (radius + offset) * cos(angle.radians)
                    let y = (radius + offset) * sin(angle.radians)

                    let position = CGPoint(x: geometry.size.width / 2 + x, y: geometry.size.height / 2 + y)

                    ParameterButton(manager: viewModel.parameterManagers[index], position: position) {
                        viewModel.showParameterDialog(for: index)
                    }

                }
            }
            .frame(width: size, height: size)
        }
        .padding(100)
        .confirmationDialog("Are you sure you want to delete all parameters?", isPresented: $viewModel.showingParameterDialog) {
            ForEach(viewModel.activeManager?.dialogOptions ?? []) { option in 
                Button(option.displayName) {
                    option.onSelect()
                }
            }
            Button("Cancelar", role: .cancel) {}
        }
    }
}
