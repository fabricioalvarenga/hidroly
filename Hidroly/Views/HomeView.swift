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
            let quaterOfWindowY = geometry.size.height / 4
            let size = min(geometry.size.width, geometry.size.height)
            let radius = size * 0.2
            let offset = radius * 1.05

            ZStack {
                HStack {
                    Text("Seu Peso:")

                    TextField("", value: $viewModel.weight, formatter: NumberFormatter()) 
                        .textFieldStyle(.roundedBorder)

                    Stepper("", value: $viewModel.weight)
                        .labelsHidden()
                }
                .offset(y: -quaterOfWindowY * 1.8)
                .padding()

                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .padding(radius)

                Circle()
                .trim(from: 0.0, to: intakeProgress)
                .stroke(AngularGradient(colors: [.blue, .cyan],
                                        center: .center,
                                        startAngle: Angle(degrees: 0),
                                        endAngle: Angle(degrees: 360 * intakeProgress)),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .padding(radius)
                .rotationEffect(.degrees(-90))

                Text("\(Int(intakeProgress * 100))%")
                    .font(.largeTitle)
                    .bold()

                let count = Double(viewModel.parameterManagers.count)

                ForEach(viewModel.parameterManagers.indices, id: \.self) { index in
                    let angle = Angle.degrees(360.0 / count * Double(index))

                    let x = (radius + offset) * cos(angle.radians)
                    let y = (radius + offset) * sin(angle.radians)

                    ParameterButton(manager: viewModel.parameterManagers[index]) {
                        viewModel.showParameterDialog(for: index)
                    }
                    .offset(x: x, y: y)
                }
            }
            .offset(y: quaterOfWindowY)
        }
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
