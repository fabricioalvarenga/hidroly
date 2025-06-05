//
//  WeightModel.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum WeightModel: String, CaseIterable, Identifiable {
    case light
    case medium
    case heavy
    case veryHeavy

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .light: "Menos de 60kg"
            case .medium: "Entre 60kg e 79kg"
            case .heavy: "Entre 80kg e 100kg"
            case .veryHeavy: "Mais de 100kg"
        }
    }
}

