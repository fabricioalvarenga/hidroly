//
//  Diet.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

import SwiftUI

struct Diet: HidratationParameterProtocol {
    var icon = Image(systemName: "fork.knife.circle")

    var options: [(key: String, value: String)] = [
        ("none", "Nenhuma"),
        ("balanced", "Balanceada"),
        ("vegetarian", "Vegetariana"),
        ("vegan","Vegana"),
        ("lowCarb", "Low Carb")
    ]
}
