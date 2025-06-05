//
//  Activity.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum Activity: String, CaseIterable, Identifiable {
    case none_or_slight
    case moderate
    case intense

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .none_or_slight: "Nenhuma ou Leve"
            case .moderate: "Moderada"
            case .intense: "Intensa"
        }
    }
}

extension Activity: IdentifiableParameterHidratation {}
