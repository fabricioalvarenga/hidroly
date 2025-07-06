//
//  ClimateType.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

enum ClimateType: String, ConfigurableParameter {
    case temperateOrCold = "temperate_or_cold"
    case hot = "hot"
    case veryHot = "very_hot"

    var id: String { self.rawValue }

    var displayName: String {
        let names = [
            Self.temperateOrCold: "Temperado ou Frio",
            Self.hot: "Quente",
            Self.veryHot: "Muito Quente"
        ]
        return names[self] ?? ""
    }

    var multiplicationFactor: Double {
        return 1.0
    }

    var sumFactor: Double {
        let factors = [
            Self.temperateOrCold: 0.0,
            Self.hot: 300.0,
            Self.veryHot: 600.0
        ]
        return factors[self] ?? 0.0
    }
}
