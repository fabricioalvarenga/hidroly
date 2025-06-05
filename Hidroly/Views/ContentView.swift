//
//  ContentView.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: TabModel = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                TabView(selection: $activeTab) {
                    Tab.init(value: .home) {
                        HomeView()
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    
                    Tab.init(value: .history) { 
                        Text("Histórico")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }

                    Tab.init(value: .notifications) {
                        Text("Notificações")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }

                    Tab.init(value: .settings) {
                        Text("Configurações")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                }
            }

            CustomTabBar(activeTab: $activeTab)
        }
    }
}

#Preview {
    ContentView()
}
