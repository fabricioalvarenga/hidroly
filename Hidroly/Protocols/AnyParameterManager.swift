//
//  AnyParameterManager.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI
import Combine

protocol AnyParameterManager: ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
    associatedtype C: ConfigurableParameter

    var parameterType: C.Type { get }
    var title: String { get }
    var icon: Image { get }
    var itemWasSelected: Bool { get }
    var selectedDisplayName: String { get }
    var selectedMultiplicationFactor: Double { get }
    var selectedSumFactor: Double { get }
    var dialogOptions: [ParameterOption] { get }

    // func selectOption(at index: Int)

    func isParameterOfType(_ type: Any.Type) -> Bool
}
