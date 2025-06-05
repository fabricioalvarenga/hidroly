//
//  HomeView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/05/25.
//
import SwiftUI

struct HomeView: View {
    @State private var intakeProgress = 0.5
    @State private var showOptionsSheet = false
    @State private var hidratationParameter: HidratationParameter?

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

                ForEach(1..<7) { index in 
                    // let angle = Angle.degrees(Double(index) / 5.0 * 360.0)
                    let angle = Angle.degrees(360.0 / 6 * Double(index))

                    let x = (radius + offset) * cos(angle.radians)
                    let y = (radius + offset) * sin(angle.radians)

                    let position = CGPoint(x: geometry.size.width / 2 + x, y: geometry.size.height / 2 + y)

                    drawButton(at: position, for: index)
                }
            }
            .frame(width: size, height: size)
        }
        .padding(100)
        .confirmationDialog("", isPresented: $showOptionsSheet) {
            switch hidratationParameter {
                case .age: chooseOptionView(for: Age.self)
                case .weight: chooseOptionView(for: Weight.self)
                case .gender: chooseOptionView(for: Gender.self)
                case .activity: chooseOptionView(for: Activity.self)
                case .climate: chooseOptionView(for: Climate.self)
                case .diet: chooseOptionView(for: Diet.self)
                default: EmptyView()
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    @ViewBuilder
    func drawButton(at position: CGPoint, for index: Int) -> some View {
        Button {
            hidratationParameter = HidratationParameter(rawValue: index)
            showOptionsSheet.toggle()
        } label: {
            (HidratationParameter(rawValue: index)?.icon ?? Image(systemName: "exclamationmark.triangle"))
                .foregroundStyle(.blue)
                .padding(10)
                .background(Circle().fill(Color.white))
                .shadow(radius: 2)
        }
        .position(x: position.x, y: position.y)
    }

    @ViewBuilder
    func chooseOptionView<T: IdentifiableParameterHidratation>(for type: T.Type) -> some View {
        ForEach(Array(T.allCases), id: \.id) { choosedOption in 
            Button(choosedOption.description) {}
        }
    }
}
