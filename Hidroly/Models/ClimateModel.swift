//
//  ClimateModel.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum ClimateModel: String, CaseIterable, Identifiable {
    case temperate_or_cold
    case hot
    case veryHot

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .temperate_or_cold: "Temperado ou Frio"
            case .hot: "Quente"
            case .veryHot: "Muito Quente"
        }
    }
}

