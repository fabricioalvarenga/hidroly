//
//  ParameterOption.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import Foundation

struct ParameterOption: Identifiable {
    let id = UUID()
    let displayName: String
    let onSelect: () -> Void
}
