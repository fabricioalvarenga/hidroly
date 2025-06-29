//
//  StylizedButton.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 29/06/25.
//

import SwiftUI

struct StylizedButton<ButtonContent: View, ButtonShape: Shape, ButtonBackgroundStyle: ShapeStyle>: View, StylizedButtonProtocol {
    let buttonContent: ButtonContent
    let buttonShape: ButtonShape
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    let buttonContentColor: Color
    let buttonBackgroundStyle: ButtonBackgroundStyle
    let buttonBorderColor: Color
    let buttonBorderWidth: CGFloat
    let buttonFont: Font?
    let buttonShadowColor: Color
    let buttonShadowRadius: CGFloat
    let buttonShadowOffset: CGSize

    let externalText: String?
    let externalTextPosition: Edge
    let externalTextColor: Color
    let externalTextFont: Font
    let externalTextAlignment: TextAlignment
    let externalTextLineLimit: Int?
    let externalTextSpacing: CGFloat
    let externalTextMaxWidth: CGFloat

    let action: () -> Void

    init(content: ButtonContent,
         shape: ButtonShape,
         buttonWidth: CGFloat = 40.0,
         buttonHeight: CGFloat = 40.0,
         buttonContentColor: Color = .white,
         buttonBackgroundStyle: ButtonBackgroundStyle = Color.blue.gradient,
         buttonBorderColor: Color = .clear,
         buttonBorderWidth: CGFloat = 0.0,
         buttonFont: Font? = .body,
         buttonShadowColor: Color = .black.opacity(0.4),
         buttonShadowRadius: CGFloat = 5.0,
         buttonShadowOffset: CGSize = CGSize(width: 5.0, height: 5.0),
         externalText: String? = nil,
         externalTextPosition: Edge = .bottom,
         externalTextColor: Color = Color.secondary,
         externalTextFont: Font = .caption,
         externalTextAlignment: TextAlignment = .leading,
         externalTextLineLimit: Int? = 2,
         externalTextSpacing: CGFloat = 12,
         externalTextMaxWidth: CGFloat = 60,
         action: @escaping () -> Void) {
                
        self.buttonContent = content
        self.buttonShape = shape
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.buttonContentColor = buttonContentColor
        self.buttonBackgroundStyle = buttonBackgroundStyle
        self.buttonBorderColor = buttonBorderColor
        self.buttonBorderWidth = buttonBorderWidth
        self.buttonFont = buttonFont
        self.buttonShadowColor = buttonShadowColor
        self.buttonShadowRadius = buttonShadowRadius
        self.buttonShadowOffset = buttonShadowOffset

        self.externalText = externalText
        self.externalTextPosition = externalTextPosition
        self.externalTextColor = externalTextColor
        self.externalTextFont = externalTextFont
        self.externalTextAlignment = externalTextAlignment
        self.externalTextLineLimit = externalTextLineLimit
        self.externalTextSpacing = externalTextSpacing
        self.externalTextMaxWidth = externalTextMaxWidth

        self.action = action
    }

    var body: some View {
        switch externalTextPosition {
        case .top:
            VStack(spacing: externalTextSpacing) {
                textView
                buttonView
            }
        case .bottom:
            VStack(spacing: externalTextSpacing) {
                buttonView
                textView
            }
        case .leading:
            HStack(spacing: externalTextSpacing) {
                textView
                buttonView
            }
        case .trailing:
            HStack(spacing: externalTextSpacing) {
                buttonView
                textView
            }
        }
    }

    @ViewBuilder
    private var buttonView: some View {
        Button(action: action) {
            buttonContent
                .font(buttonFont)
                .frame(width: buttonWidth, height: buttonHeight)
                .foregroundStyle(buttonContentColor)
                .padding()
                .background(
                    buttonShape
                        .fill(buttonBackgroundStyle)
                        .overlay(
                            buttonShape
                                .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
                        )
                    .shadow(color: buttonShadowColor, radius: buttonShadowRadius, x: buttonShadowOffset.width, y: buttonShadowOffset.height)
                )
        }
    }

    @ViewBuilder
    private var textView: some View {
        if let externalText {
            Text(externalText)
                .frame(maxWidth: externalTextMaxWidth)
                .font(externalTextFont)
                .foregroundStyle(externalTextColor)
                .multilineTextAlignment(externalTextAlignment)
                .lineLimit(externalTextLineLimit)
        }
    }
}
