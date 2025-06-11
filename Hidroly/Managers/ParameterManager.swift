//
//  ParameterManager.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

class ParameterManager<T: ConfigurableParameter>: AnyParameterManager {
    @Published var selectedValue: T?
    
    let parameterType: T.Type
    let title: String
    let icon: Image

    init(parameterType: T.Type, title: String, icon: Image) {
        self.parameterType = parameterType
        self.title = title
        self.icon = icon
    }
    
     var selectedDisplayName: String {
         selectedValue?.displayName ?? "Não selecionado"
     }

    var calculationFactor: Double {
        selectedValue?.calculationFactor ?? 0.0
    }

    var dialogOptions: [ParameterOption] {
        Array(T.allCases).map { option in 
            ParameterOption(displayName: option.displayName) { [weak self] in 
                self?.selectedValue = option
            }
        }
    }

    func selectOption(at index: Int) {
        let allOptions = Array(T.allCases)
        guard index < allOptions.count else { return }
        selectedValue = allOptions[index]
    }
}
