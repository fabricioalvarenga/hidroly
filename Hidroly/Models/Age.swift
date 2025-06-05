//
//  Age.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum Age: String, CaseIterable, Identifiable {
    case child
    case middleAge
    case senior

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .child: "Menos de 8 anos"
            case .middleAge: "Entre 8 e 59 anos"
            case .senior: "Mais de 59 anos"
        }
    }
}

extension Age: IdentifiableParameterHidratation {}
