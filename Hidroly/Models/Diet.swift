//
//  Diet.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum Diet: String, CaseIterable, Identifiable {
    case none
    case balanced
    case vegetarian
    case vegan 
    case lowCarb

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .none: "Nenhuma"
            case .balanced: "Balanceada"
            case .vegetarian: "Vegetariana"
            case .vegan: "Vegana"
            case .lowCarb: "Low Carb"
        }
    }
}

extension Diet: IdentifiableParameterHidratation {}
