//
//  DietType.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

enum DietType: String, ConfigurableParameter {
    case none = "none"
    case balanced = "balanced"
    case vegetarian = "vegetarian"
    case vegan = "vegan"
    case lowCarb = "low_carb"

    var id: String { self.rawValue }

    var displayName: String {
        let names = [
            Self.none: "Nenhuma",
            Self.balanced: "Balanceada",
            Self.vegetarian: "Vegetariana",
            Self.vegan: "Vegana",
            Self.lowCarb: "Low Carb"
        ]
        return names[self] ?? ""
    }

    var calculationFactor: Double {
        let factors = [
            Self.none: 0.0,
            Self.balanced: 250.0,
            Self.vegetarian: 250.0,
            Self.vegan: 250.0,
            Self.lowCarb: 250.0
        ]
        return factors[self] ?? 0.0
    }
}
