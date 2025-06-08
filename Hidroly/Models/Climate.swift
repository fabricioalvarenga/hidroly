//
//  Climate.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 04/06/25.
//


import SwiftUI

struct Climate: HidratationParameterProtocol {
    var icon = Image(systemName: "cloud.sun")

    var options: [(key: String, value: String)] = [
        ("temperate_or_cold", "Temperado ou Frio"),
        ("hot","Quente"),
        ("veryHot", "Muito Quente"),
    ]
}
