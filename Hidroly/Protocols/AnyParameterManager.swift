//
//  AnyParameterManager.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

protocol AnyParameterManager: ObservableObject {
    var title: String { get }
    var icon: Image { get }
    var itemSelected: Bool { get }
    var selectedDisplayName: String { get }
    var calculationFactor: Double { get }
    var dialogOptions: [ParameterOption] { get }

    func selectOption(at index: Int)
}
