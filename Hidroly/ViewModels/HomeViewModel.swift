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
            .sink { [weak self] weight in
                self?.recalculateIntakeTarget()
            }
            .store(in: &cancellables)
        
        for parameterManager in parameterManagers {
            parameterManager.objectWillChange.eraseToAnyPublisher()
                .sink { [weak self] in
                    self?.recalculateIntakeTarget()
                }
                .store(in: &cancellables)
        }
    }

    private func recalculateIntakeTarget() {
        guard let genderParameter = getParameter(GenderType.self) else { return }
        
        let parameterManagersWithoutGender = parameterManagers.filter { parameter in
            parameter.parameterType != GenderType.self
        }
        
        intakeTarget = weight * genderParameter.selectedMultiplicationFactor
       
        for parameterManager in parameterManagersWithoutGender {
            intakeTarget *= parameterManager.selectedMultiplicationFactor
            intakeTarget += parameterManager.selectedSumFactor
        }
    }
    
    private func getParameter<T: ConfigurableParameter>(_ type: T.Type) -> ParameterManager<T>? {
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
