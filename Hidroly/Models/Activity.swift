//
//  Activity.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

import SwiftUI

struct Activity: HidratationParameterProtocol {
    var icon = Image(systemName: "figure.run")

    var options: [(key: String, value: String)] = [
        ("none_or_slight", "Nenhuma ou Leve"),
        ("moderate", "Moderada"),
        ("intense", "Intensa")
    ]
}
