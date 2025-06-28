//
//  HomeView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var weight: Float = 60.0
    @State private var intakeProgress = 0.5
    @State private var amountIngested = 200
    @StateObject var viewModel = HomeViewModel()

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.locale = Locale.current
        return formatter
    }()
    
    var body: some View {
        VStack {
            weightInput

            GeometryReader { geometry in
                let minSize = min(geometry.size.width, geometry.size.height)
                let circlePadding = minSize * 0.2
                let radius = minSize / 2 * 0.45
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        drawMainCircle

                        Text("\(Int(intakeProgress * 100))%")
                            .font(.largeTitle)
                            .bold()
                               
                        CircularTextView(radius: radius, text: "SUA META: \(amountIngested) ml")

                        drawParameterButtons(size: geometry.size)
                    }
                    .padding(circlePadding)

                    Spacer()
                }
                .frame(width: geometry.size.width)
                .padding(.bottom, circlePadding)
            }
            .padding(.bottom)
        }
        .navigationTitle(TabModel.home.title)
        .confirmationDialog("Escolha uma opção", isPresented: $viewModel.showingParameterDialog) {
            ForEach(viewModel.activeManager?.dialogOptions ?? []) { option in 
                Button(option.displayName) {
                    option.onSelect()
                }
            }
            Button("Cancelar", role: .cancel) {}
        }
    }

    @ViewBuilder
    var weightInput: some View {
        ZStack {
            Capsule()
                .foregroundStyle(Color.blue.gradient)
                .frame(height: 50)
                .customShadow(opacity: 0.2, in: .capsule)
                .padding()
                
            HStack {
                Text("Seu Peso:")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)

                TextField("", value: $weight, formatter: numberFormatter) 
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .overlay(
                        Image(systemName: "scalemass")
                            .padding(.leading),
                        alignment: .leading
                    )
                    .overlay(
                        Text("kg")
                            .padding(.trailing),
                        alignment: .trailing
                    )
                    
                CustomStepper(value: $weight, step: 0.5)
            }
            .padding(.horizontal, 32)
        }
        .padding(.top, 16)
    }

    @ViewBuilder
    var drawMainCircle: some View {
        let circleLineWdith: CGFloat = 20.0
    
        Circle()
            .stroke(Color.gray.opacity(0.2), lineWidth: circleLineWdith)
            .padding(10)
            .customShadow(opacity: 0.1, in: .circle)

        Circle()
            .trim(from: 0.0, to: intakeProgress)
            .stroke(AngularGradient(colors: [.blue, .cyan],
                        center: .center,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360 * intakeProgress)),
                    style: StrokeStyle(lineWidth: circleLineWdith, lineCap: .round)
                   )
            .padding(10)
            .rotationEffect(.degrees(-90))
    }
    
    @ViewBuilder
    func drawParameterButtons(size: CGSize) -> some View {
        let minSize = min(size.width, size.height)
        let radius = minSize / 2 * 0.825
        
        let count = Double(viewModel.parameterManagers.count)
        
        ForEach(viewModel.parameterManagers.indices, id:\.self) { index in
            let angle = Angle.degrees(360.0 / count * Double(index))
            
            let x = radius * cos(angle.radians)
            let y = radius * sin(angle.radians)
            
            let buttonTextPosition: ParameterButton.TextPosition = (angle.degrees >= 0 && angle.degrees <= 180) ? .bottom : .top
            
            ParameterButton(manager: viewModel.parameterManagers[index], textPosition: buttonTextPosition) {
                viewModel.showParameterDialog(for: index)
            }
            .offset(x: x, y: y)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
