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
    @State private var option: Option?

    private enum Option: Int {
        case age = 1
        case weight
        case gender
        case activity
        case climate
        case diet

        var icon: Image {
            switch self {
                case .age: Image(systemName: "person.crop.circle.badge.clock")
                case .weight: Image(systemName: "scalemass")
                case .gender: Image(systemName: "person.fill")
                case .activity: Image(systemName: "figure.run")
                case .climate: Image(systemName: "cloud.sun")
                case .diet: Image(systemName: "fork.knife.circle")
            }
        }
    }

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
            switch option {
                case .age: ageOptionsView
                case .weight: weightOptionsView
                case .gender: genderOptionsView
                case .activity: activityOptionsView
                case .climate: climateOptionsView
                case .diet: dietOptionsView
                default: EmptyView()
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    @ViewBuilder
    func drawButton(at position: CGPoint, for index: Int) -> some View {
        Button {
            option = Option(rawValue: index)
            showOptionsSheet.toggle()
        } label: {
            (Option(rawValue: index)?.icon ?? Image(systemName: "exclamationmark.triangle"))
                .foregroundStyle(.blue)
                .padding(10)
                .background(Circle().fill(Color.white))
                .shadow(radius: 2)
        }
        .position(x: position.x, y: position.y)
    }

    @ViewBuilder
    var ageOptionsView: some View {
        ForEach(AgeModel.allCases) { age in 
            Button(age.description) {}
        }
    }

    @ViewBuilder
    var weightOptionsView: some View {
        ForEach(WeightModel.allCases) { weight in 
            Button(weight.description) {}
        }
    }

    @ViewBuilder
    var genderOptionsView: some View {
        ForEach(GenderModel.allCases) { gender in 
            Button(gender.description) {}
        }
    }
    
    @ViewBuilder
    var activityOptionsView: some View {
        ForEach(ActivityModel.allCases) { activity in 
            Button(activity.description) {}
        }
    }

    @ViewBuilder
    var climateOptionsView: some View {
        ForEach(ClimateModel.allCases) { climate in 
            Button(climate.description) {}
        }
    }

    @ViewBuilder
    var dietOptionsView: some View {
        ForEach(DietModel.allCases) { diet in 
            Button(diet.description) {}
        }
    }
}
