//
//  Gender.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

import SwiftUI

struct Gender: HidratationParameterProtocol {
    var icon = Image(systemName: "person.fill")

    var options: [(key: String, value: String)] = [
        ("male", "Masculino"),
        ("female", "Feminino"),
        ("notInformed", "Não Informar")
    ]
}
