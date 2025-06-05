//
//  Tab.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 26/05/25.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case history = "calendar"
    case notifications = "bell"
    case settings = "gear"

    var title: String {
        switch self {
            case .home: "Início"
            case .history: "Histórico"
            case .notifications: "Notificações"
            case .settings: "Configurações"
        }
    }
}
