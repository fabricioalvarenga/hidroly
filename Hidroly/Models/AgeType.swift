//
//  AgeType.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

enum AgeType: String, ConfigurableParameter {
    case child = "child"
    case middleAge = "middle_age"
    case senior = "senior"

    var id: String { self.rawValue }

    var displayName: String {
        let names = [
            Self.child: "Menos de 8 anos",
            Self.middleAge: "Entre 8 e 59 anos",
            Self.senior: "Mais de 59 anos",
        ]
        return names[self] ?? ""
    }

    var calculationFactor: Double {
        let factors = [
            Self.child: 1.0,
            Self.middleAge: 1.0,
            Self.senior: 1.0
        ]
        return factors[self] ?? 1.0
    }
}
