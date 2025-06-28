//
//  CircularButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 25/06/25.
//

import SwiftUI

protocol CircularButtonStyle {
    associatedtype Content: View
    associatedtype ShadowShape: InsettableShape

    var content: Content { get }
    var diameter: CGFloat { get }
    var ButtonForegroundStyle: AnyShapeStyle { get }
    var ButtonBackgroundStyle: AnyShapeStyle { get }
    var outsideText: String { get }
    var outsideTextFont: Font? { get }
    var outsideTextMaxWidth: CGFloat? { get }
    var outsideTextPosition: TextPosition? { get }
    var outsideTextForegroundStyle: AnyShapeStyle { get }
    var outsideTextAlignment: TextAlignment { get }
    var outsideTextLineLimit: Int? { get }
    var outsideTextMinimumScaleFactor: CGFloat { get }
    var shadow: (color: Color, opacity: Double, radius: CGFloat, x: CGFloat, y: CGFloat, shape: ShadowShape)? { get }
    var action: () -> Void { get }
}
