//
//  CircularButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 25/06/25.
//

import SwiftUI

struct CircularButton<Content: View, ShadowShape: InsettableShape>: View, CircularButtonStyle {
    let content: Content
    let diameter: CGFloat
    var ButtonForegroundStyle: AnyShapeStyle
    var ButtonBackgroundStyle: AnyShapeStyle
    var outsideText: String
    var outsideTextFont: Font?
    var outsideTextMaxWidth: CGFloat?
    var outsideTextPosition: TextPosition?
    var outsideTextForegroundStyle: AnyShapeStyle
    var outsideTextAlignment: TextAlignment 
    var outsideTextLineLimit: Int?
    var outsideTextMinimumScaleFactor: CGFloat 
    var shadow: (color: Color, opacity: Double, radius: CGFloat, x: CGFloat, y: CGFloat, shape: ShadowShape)? 
    var action: () -> Void

    init(content: Content,
         diameter: CGFloat,
         ButtonForegroundStyle: AnyShapeStyle = AnyShapeStyle(Color.primary),
         ButtonBackgroundStyle: AnyShapeStyle = AnyShapeStyle(Color.secondary),
         outsideText: String = "",
         outsideTextFont: Font?,
         outsideTextMaxWidth: CGFloat? = nil,
         outsideTextPosition: TextPosition? = nil,
         outsideTextForegroundStyle: AnyShapeStyle = AnyShapeStyle(Color.primary),
         outsideTextAlignment: TextAlignment = .center,
         outsideTextLineLimit: Int? = nil,
         outsideTextMinimumScaleFactor: CGFloat = 1,
         shadow: (color: Color, opacity: Double, radius: CGFloat, x: CGFloat, y: CGFloat, shape: ShadowShape)? = nil, 
         action: @escaping () -> Void) {

        self.content = content
        self.diameter = diameter
        self.ButtonForegroundStyle = ButtonForegroundStyle
        self.ButtonBackgroundStyle = ButtonBackgroundStyle
        self.outsideText = outsideText
        self.outsideTextFont = outsideTextFont
        self.outsideTextMaxWidth = outsideTextMaxWidth
        self.outsideTextPosition = outsideTextPosition
        self.outsideTextForegroundStyle = outsideTextForegroundStyle
        self.outsideTextAlignment = outsideTextAlignment
        self.outsideTextLineLimit = outsideTextLineLimit
        self.outsideTextMinimumScaleFactor = outsideTextMinimumScaleFactor
        self.shadow = shadow
        self.action = action
    }

    var body: some View {
        if outsideTextPosition == .top || outsideTextPosition == .bottom {
            VStack {
                if outsideTextPosition == .top { text }

                drawButton

                if outsideTextPosition == .bottom { text }
            }
   } else {
            HStack {
                if outsideTextPosition == .trailing { text }

                drawButton

                if outsideTextPosition == .leading { text }
            }
        }
    }

    @ViewBuilder
    var drawButton: some View {
        content
            .frame(width: diameter, height: diameter)
            .foregroundStyle(ButtonForegroundStyle)
            .padding(10)
            .background(alignment: .leading) {
                if let shadow {
                    Circle()
                        .fill(ButtonBackgroundStyle)
                        .customShadow(opacity: shadow.opacity, in: shadow.shape)
                } else {
                    Circle()
                        .fill(ButtonBackgroundStyle)
                }
            }
    }


    @ViewBuilder
    var text: some View {
        Text(outsideText)
            .font(outsideTextFont)
            .foregroundStyle(outsideTextForegroundStyle)
            .multilineTextAlignment(outsideTextAlignment)
            .lineLimit(outsideTextLineLimit)
            .frame(maxWidth: outsideTextMaxWidth)
            .minimumScaleFactor(outsideTextMinimumScaleFactor)
            .fixedSize(horizontal: false, vertical: true)

    }
}
