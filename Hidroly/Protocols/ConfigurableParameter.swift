//
//  HidratattionParameterProtocol.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 05/06/25.
//

import SwiftUI

protocol ConfigurableParameter: CaseIterable, Identifiable {
    var displayName: String { get }
    var multiplicationFactor: Double { get }
    var sumFactor: Double { get }
}

