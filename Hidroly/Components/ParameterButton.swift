//
//  ParameterButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 09/06/25.
//

import SwiftUI

struct ParameterButton: View {
    let manager: any AnyParameterManager
    let textPosition: TextPosition
    let action: () -> Void
    
    enum TextPosition {
        case top
        case bottom
    }
    
    var body: some View {
        Button(action: action) {
            VStack {
                if textPosition == .top { text }
                
                icon
                
                if textPosition == .bottom { text }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: manager.selectedDisplayName)
    }
    
    @ViewBuilder
    var icon: some View {
        manager.icon
            .foregroundStyle(.white)
            .padding(10)
            .background(alignment: .leading) {
                Circle()
                    .fill(manager.itemSelected ? Color.blue : Color.secondary)
            }
            .shadow(radius: 2)
    }
    
    @ViewBuilder
    var text: some View {
        Text(manager.title)
            .font(.caption2)
            .foregroundStyle(manager.itemSelected ? Color.blue : Color.secondary)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .frame(maxWidth: 80)
            .minimumScaleFactor(0.8)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    let manager = ParameterManager(parameterType: AgeType.self, title: "Idade", icon: Image(systemName: "person.crop.circle.badge.clock"))
    ParameterButton(manager: manager, textPosition: ParameterButton.TextPosition.bottom, action: {})
}

// import SwiftUI
//
// struct ParameterButton: View {
//     let manager: any AnyParameterManager
//     var position: CGPoint?
//     let action: () -> Void
//
//    var body: some View {
//         VStack {
//             Button(action: action) {
//                 manager.icon
//                     .foregroundStyle(.white)
//                     .padding(10)
//                     .background(alignment: .leading) {
//                         Circle()
//                             .fill(manager.itemSelected ? Color.blue : Color.secondary)
//                     }
//                     .shadow(radius: 2)
//             }
//
//             Text(manager.title)
//                 .font(.caption2)
//                 .foregroundStyle(manager.itemSelected ? Color.blue : Color.secondary)
//                 .multilineTextAlignment(.center)
//                 .lineLimit(2)
//                 .frame(maxWidth: 80)
//                 .minimumScaleFactor(0.8)
//                 .fixedSize(horizontal: false, vertical: true)
//            
//         }
//         .animation(.easeInOut(duration: 0.3), value: manager.selectedDisplayName)
//    }
// }
//
// #Preview {
//     let manager = ParameterManager(parameterType: AgeType.self, title: "Idade", icon: Image(systemName: "person.crop.circle.badge.clock"))
//     ParameterButton(manager: manager, action: {})
// }
