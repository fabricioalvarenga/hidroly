//
//  HomeViewModel.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var showingParameterDialog = false
    @Published var weight: Double = 0.0
    @Published var intakeTarget: Double = 0.0
    @Published var intakeProgress: Double = 0.0
    @Published var amountIngested: Double = 0.0
    @Published var parameterManagers: [any AnyParameterManager] = []
    @Published var activeManagerIndex: Int?

    init() {
        setupParameters()
    }

    private func setupParameters() {
        parameterManagers = [
            ParameterManager(parameterType: AgeType.self, title: "Idade", icon: Image(systemName: "person.crop.circle.badge.clock")),
            ParameterManager(parameterType: ActivityType.self, title: "Atividade", icon: Image(systemName: "figure.run")),
            ParameterManager(parameterType: ClimateType.self, title: "Clima", icon: Image(systemName: "cloud.sun")),
            ParameterManager(parameterType: DietType.self, title: "Dieta", icon: Image(systemName: "fork.knife.circle")),
            ParameterManager(parameterType: GenderType.self, title: "Gênero", icon: Image(systemName: "person.fill"))
        ]
    }

    func showParameterDialog(for index: Int) {
        activeManagerIndex = index
        showingParameterDialog = true
    }

    var activeManager: (any AnyParameterManager)? {
        guard let index = activeManagerIndex,
            index < parameterManagers.count else { return nil }

        return parameterManagers[index]
    }
}
