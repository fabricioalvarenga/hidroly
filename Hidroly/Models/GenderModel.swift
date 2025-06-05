//
//  GenderModel.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

enum GenderModel: String, CaseIterable, Identifiable {
    case male
    case female
    case notInformed

    var id: String { self.rawValue }

    var description: String {
        switch self {
            case .male: "Masculino"
            case .female: "Feminino"
            case .notInformed: "Não Informar"
        }
    }
}

