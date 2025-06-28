//
//  CircularButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 25/06/25.
//

import SwiftUI

enum Position: String {
    case top
    case bottom
    
    var rawValue: String {
        switch self {
        case .top: "top"
        case .bottom: "bottom"
        }
    }
}

protocol CircularButton: View {
    associatedtype TextPosition: RawRepresentable where TextPosition.RawValue == String
    associatedtype ButtonLabel: View
    
    var outsideText: String? { get }
    var outsideTextMaxWidth: CGFloat? { get }
    var size: CGFloat { get }
    var action: () -> Void { get }
}
