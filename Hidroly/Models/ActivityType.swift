//
//  ActivityType.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

enum ActivityType: String, ConfigurableParameter {
    case noneOrSlight = "none_or_slight"
    case moderate = "moderate"
    case intense = "intense"

    var id: String { self.rawValue }

    var displayName: String {
        let names = [
            Self.noneOrSlight: "Nenhuma ou Leve",
            Self.moderate: "Moderada",
            Self.intense: "Intensa"
        ]
        return names[self] ?? ""
    }

    var multiplicationFactor: Double {
        return 1.0
    }

    var sumFactor: Double {
        let factors = [
            Self.noneOrSlight: 0.0,
            Self.moderate: 300.0,
            Self.intense: 600.0
        ]
        return factors[self] ?? 0.0
    }
}
