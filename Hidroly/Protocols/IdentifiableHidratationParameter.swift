//
//  IdentifiableHidratationParameter.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 05/06/25.
//

import Foundation

protocol IdentifiableParameterHidratation: CaseIterable, Identifiable {
    var description: String { get }
}
