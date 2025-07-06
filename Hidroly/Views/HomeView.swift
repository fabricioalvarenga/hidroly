//
//  HomeView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/05/25.
//

import SwiftUI

struct HomeView: View {
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
            weightInputView

            GeometryReader { geometry in
                let minSize = min(geometry.size.width, geometry.size.height)
                let circlePadding = minSize * 0.225
                let radius = minSize / 2 * 0.4
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        mainCircleView

                        CircularTextView(radius: radius, text: "META DIÁRIA: \(viewModel.intakeTarget) ml", textPosition: .top)

                        Text("\(Int(viewModel.intakeProgress * 100))%")
                            .font(.largeTitle)
                            .bold()
                               
                        CircularTextView(radius: radius, text: "INGERIDO ATÉ AGORA: \(viewModel.amountIngested) ml", textPosition: .bottom)

                        parameterButtonsView(size: geometry.size)
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
    private var weightInputView: some View {
        ZStack {
            Capsule()
                .foregroundStyle(Color.blue.gradient)
                .frame(height: 50)
                .stylizedShadow(in: .capsule)
                .padding()
                
            HStack {
                Text("Seu Peso:")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)

                TextField("", value: $viewModel.weight, formatter: numberFormatter) 
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
                    
                CustomStepper(value: $viewModel.weight, step: 0.5)
            }
            .padding(.horizontal, 32)
        }
        .padding(.top, 16)
    }

    @ViewBuilder
    private var mainCircleView: some View {
        let circleLineWdith: CGFloat = 20.0
    
        Circle()
            .stroke(Color.gray.opacity(0.2), lineWidth: circleLineWdith)
            .padding(10)
            .stylizedShadow(in: .circle)

        Circle()
            .trim(from: 0.0, to: viewModel.intakeProgress)
            .stroke(AngularGradient(colors: [.blue, .cyan],
                        center: .center,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360 * viewModel.intakeProgress)),
                    style: StrokeStyle(lineWidth: circleLineWdith, lineCap: .round)
                   )
            .padding(10)
            .rotationEffect(.degrees(-90))
    }
    
    @ViewBuilder
    private func parameterButtonsView(size: CGSize) -> some View {
        let minSize = min(size.width, size.height)
        let radius = minSize / 2 * 0.8075
        
        let count = Double(viewModel.parameterManagers.count)
        
        ForEach(viewModel.parameterManagers.indices, id:\.self) { index in
            let angle = Angle.degrees(360.0 / count * Double(index))
            
            let x = radius * cos(angle.radians)
            let y = radius * sin(angle.radians)
            
            let manager = viewModel.parameterManagers[index]
            let buttonBackgroundColor = manager.itemWasSelected ? Color.green : Color.secondary
            let textPosition: Edge = (angle.degrees >= 0 && angle.degrees <= 180) ? .bottom : .top

            // ParameterButton(manager: viewModel.parameterManagers[index], textPosition: buttonTextPosition) {
            StylizedButton(content: manager.icon,
                           shape: Circle(),
                           buttonBackgroundStyle: buttonBackgroundColor.gradient,
                           externalText: manager.title,
                           externalTextPosition: textPosition,
                           externalTextColor: buttonBackgroundColor) {
                viewModel.showParameterDialog(for: index)
            }
            .offset(x: x, y: y)
            .animation(.easeInOut(duration: 0.3), value: viewModel.parameterManagers[index].selectedDisplayName)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
