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
    @Published var weight: Double = 60.0
    @Published var intakeTarget: Double = 0.0
    @Published var intakeProgress: Double = 0.0
    @Published var amountIngested: Double = 0.0
    
    var parameterManagers: [any AnyParameterManager] = []
    
    private var activeManagerIndex: Int?
    private var cancellables = Set<AnyCancellable>()
                                
    init() {
        setupParameters()
        setupObservers()
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
    
    private func setupObservers() {
        $weight
            .sink { [weak self] newWeight in
                self?.calculateIntakeTarget(weight: newWeight)
            }
            .store(in: &cancellables)
        
        for parameterManager in parameterManagers {
            parameterManager.objectWillChange.eraseToAnyPublisher()
                .sink { [weak self] in
                    guard let self else { return }
                    self.calculateIntakeTarget(weight: self.weight)
                }
                .store(in: &cancellables)
        }
    }

    private func calculateIntakeTarget(weight: Double) {
        guard let genderParameter = getParameterOfType(GenderType.self) else { return }
        
        intakeTarget = weight * genderParameter.selectedMultiplicationFactor
       
        for parameterManager in parameterManagers {
            // The gender parameter is used to calculate the initial base of intake target
            // And then is ignored here
            if parameterManager.isParameterOfType(GenderType.self) {
                continue
            }

            intakeTarget *= parameterManager.selectedMultiplicationFactor
            intakeTarget += parameterManager.selectedSumFactor
        }
    }
    
    private func getParameterOfType<T: ConfigurableParameter>(_ type: T.Type) -> ParameterManager<T>? {
        return parameterManagers.first { $0.parameterType == T.self } as? ParameterManager<T>
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
