//
//  Weight.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//

import SwiftUI

struct Weight: HidratationParameterProtocol {
    var icon = Image(systemName: "scalemass")

    var options: [(key: String, value: String)] = [
        ("light", "Menos de 60kg"),
        ("medium", "Entre 60kg e 79kg"),
        ("heavy", "Entre 80kg e 100kg"),
        ("veryHeavy", "Mais de 100kg")
    ]
}
