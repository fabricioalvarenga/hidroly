//
//  TextPosition.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 25/06/25.
//

import Foundation

enum TextPosition: String {
    case top
    case bottom
    case trailing
    case leading
    
    var rawValue: String {
        switch self {
        case .top: "top"
        case .bottom: "bottom"
        case .trailing: "trailing"
        case .leading: "leading"
        }
    }
}

