//
//  Age.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

import SwiftUI

struct Age: HidratationParameterProtocol {
    var icon = Image(systemName: "person.crop.circle.badge.clock")

    var options: [(key: String, value: String)] = [
        ("child", "Menos de 8 anos"),
        ("middleAge", "Entre 8 e 59 anos"),
        ("senior", "Mais de 59 anos")
    ]
}
