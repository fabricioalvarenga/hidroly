//
//  StylizedButtonProtocol.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/06/25.
//

import SwiftUI

protocol StylizedButtonProtocol {
    associatedtype ButtonContent: View
    associatedtype ButtonShape: Shape
    associatedtype ButtonBackgroundStyle: ShapeStyle

    var buttonContent: ButtonContent { get }
    var buttonShape: ButtonShape { get }
    var buttonWidth: CGFloat { get }
    var buttonHeight: CGFloat { get }
    var buttonContentColor: Color { get }
    var buttonBackgroundStyle: ButtonBackgroundStyle { get }
    var buttonBorderColor: Color { get }
    var buttonBorderWidth: CGFloat { get }
    var buttonFont: Font? { get }
    var buttonShadowColor: Color { get }
    var buttonShadowRadius: CGFloat { get }
    var buttonShadowOffset: CGSize { get }

    var externalText: String? { get }
    var externalTextPosition: Edge { get }
    var externalTextColor: Color { get }
    var externalTextFont: Font { get }
    var externalTextAlignment: TextAlignment { get }
    var externalTextLineLimit: Int? { get }
    var externalTextSpacing: CGFloat { get }
    var externalTextMaxWidth: CGFloat { get }

    var action: () -> Void { get }
}

