//
//  HidratationParameter.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 05/06/25.
//

import SwiftUI

enum HidratationParameter: Int {
    case age = 1
    case weight
    case gender
    case activity
    case climate
    case diet

    var icon: Image {
        switch self {
            case .age: Image(systemName: "person.crop.circle.badge.clock")
            case .weight: Image(systemName: "scalemass")
            case .gender: Image(systemName: "person.fill")
            case .activity: Image(systemName: "figure.run")
            case .climate: Image(systemName: "cloud.sun")
            case .diet: Image(systemName: "fork.knife.circle")
        }
    }
}


