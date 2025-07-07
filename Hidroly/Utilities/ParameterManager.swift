//
//  ParameterManager.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI
import Combine

class ParameterManager<C: ConfigurableParameter>: AnyParameterManager {
    @Published var selectedOption: C?
    @Published var selectedMultiplicationFactor: Double = 1.0
    @Published var selectedSumFactor: Double = 0.0
    
    let parameterType: C.Type
    let title: String
    let icon: Image

    private var cancellables = Set<AnyCancellable>()

    init(parameterType: C.Type, title: String, icon: Image) {
        self.parameterType = parameterType
        self.title = title
        self.icon = icon
        
        setupObservers()
    }
    
    private func setupObservers() {
        $selectedOption
            .sink { [weak self] option in
                self?.selectedMultiplicationFactor = option?.multiplicationFactor ?? 1.0
                self?.selectedSumFactor = option?.sumFactor ?? 0.0
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

    func isParameterOfType(_ type: Any.Type) -> Bool {
        return parameterType == type
    }

    var itemWasSelected: Bool {
        selectedOption != nil
    }
    
    var selectedDisplayName: String {
        selectedOption?.displayName ?? "Não selecionado"
    }
    
//    var selectedMultiplicationFactor: Double {
//        selectedOption?.multiplicationFactor ?? 1.0
//    }
//
//    var selectedSumFactor: Double {
//        selectedOption?.sumFactor ?? 0.0
//    }
    
    var dialogOptions: [ParameterOption] {
        Array(C.allCases).map { option in
            ParameterOption(displayName: option.displayName) { [weak self] in
                self?.selectedOption = option
            }
        }
    }

    // func selectOption(at index: Int) {
    //     let allOptions = Array(C.allCases)
    //     guard index < allOptions.count else { return }
    //     selectedOption = allOptions[index]
    // }
}
