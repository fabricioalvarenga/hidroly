//
//  GenderType.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

enum GenderType: String, ConfigurableParameter {
    case male = "male"
    case female = "female"
    case notInformed = "not_informed"

    var id: String { self.rawValue }

    var displayName: String {
        let names = [
            Self.male: "Masculino",
            Self.female: "Feminino",
            Self.notInformed: "Não informar"
        ]
        return names[self] ?? ""
    }

    var multiplicationFactor: Double {
        let factors = [
            Self.male: 35.0,
            Self.female: 31.0,
            Self.notInformed: 31.0
        ]
        return factors[self] ?? 31.0
    }

    var sumFactor: Double {
        return 0.0
    }
}
