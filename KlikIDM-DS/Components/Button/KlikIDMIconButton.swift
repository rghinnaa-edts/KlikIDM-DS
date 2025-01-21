//
//  Button.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 19/11/24.
//


import SwiftUI

struct KlikIDMIconButton: View {
    var style: Style
    var size: Size
    var isDisabled: Bool
    var icon: String
    var iconColor: Color? = nil
    var action: () -> Void
    
    @State private var isPressed = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Button(action: action) {
            VStack {
                switch style {
                case .Primary: Primary()
                case .Secondary: Secondary()
                case .Tertiary: Tertiary()
                }
            }
            .buttonStyle(PlainButtonStyle())
            .focused($isFocused)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in isPressed = false }
            )
        }
    }
    
    func Primary() -> AnyView {
        return AnyView(
            HStack {
                Icon(Style.Primary)
            }
                .padding(Padding())
                .background(backgroundColor(Style.Primary))
                .if(!isFocused) { view in
                    view.cornerRadius(4)
                }
                .if(isFocused){ view in
                    view.overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(borderColor(Style.Primary), lineWidth: borderSize(Style.Primary))
                    )
                }
        )
    }
    
    func Secondary() -> AnyView {
        return AnyView(
            HStack {
                Icon(Style.Secondary)
            }
                .padding(Padding())
                .background(backgroundColor(Style.Secondary))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor(Style.Secondary), lineWidth: borderSize(Style.Secondary))
                )
        )
    }

    func Tertiary() -> AnyView {
        return AnyView(
            HStack {
                Icon(Style.Tertiary)
            }
                .padding(Padding())
                .background(backgroundColor(Style.Tertiary))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor(Style.Tertiary), lineWidth: borderSize(Style.Tertiary))
                )
        )
    }
    
    func Padding() -> CGFloat {
        switch size {
        case Size.Large: return 8
        case Size.Medium: return 8
        case Size.Small: return 6
        }
    }
    
    func Icon(_ style: Style) -> AnyView {
        let color = iconColor(style)
        
        return AnyView(
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(color)
                .frame(width: IconSize(), height: IconSize())
                .aspectRatio(contentMode: .fit)
        )
    }
    
    func IconSize() -> CGFloat {
        switch size {
        case Size.Large: return 24
        case Size.Medium: return 16
        case Size.Small: return 16
        }
    }
    
    func iconColor(_ style: Style) -> Color {
        switch style {
        case Style.Primary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.whiteIDM
            case (_, true, _): return Color.whiteIDM
            case (_, _, true): return Color.whiteIDM
            default : return Color.whiteIDM
            }
        case Style.Secondary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.disabled
            case (_, true, _): return Color.Button.bluePressed
            case (_, _, true): return Color.Button.blueDefault
            default : return Color.Button.blueDefault
            }
        case Style.Tertiary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.disabled
            case (_, true, _): return Color.Button.greyText
            case (_, _, true): return Color.Button.greyText
            default : return Color.Button.greyText
            }
        }
    }
    
    func backgroundColor(_ style: Style) -> Color {
        switch style {
        case Style.Primary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.disabled
            case (_, true, _): return Color.Button.bluePressed
            case (_, _, true): return Color.Button.blueDefault
            default : return Color.Button.blueDefault
            }
        case Style.Secondary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.whiteIDM
            case (_, true, _): return Color.whiteIDM
            case (_, _, true): return Color.whiteIDM
            default : return Color.whiteIDM
            }
        case Style.Tertiary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.whiteIDM
            case (_, true, _): return Color.grey20
            case (_, _, true): return Color.grey20
            default : return Color.whiteIDM
            }
        }
    }

    func borderColor(_ style: Style) -> Color {
        switch style {
        case Style.Primary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.whiteIDM
            case (_, true, _): return Color.whiteIDM
            case (_, _, true): return Color.blue30
            default : return Color.whiteIDM
            }
        case Style.Secondary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.disabled
            case (_, true, _): return Color.Button.bluePressed
            case (_, _, true): return Color.blue30
            default : return Color.Button.blueDefault
            }
        case Style.Tertiary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return Color.disabled
            case (_, true, _): return Color.Button.greyPressed
            case (_, _, true): return Color.Button.greyPressed
            default : return Color.Button.greyDefault
            }
        }
    }
    
    func borderSize(_ style: Style) -> CGFloat {
        switch style {
        case Style.Primary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return 0
            case (_, true, _): return 0
            case (_, _, true): return 2
            default : return 0
            }
        case Style.Secondary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return 1
            case (_, true, _): return 1
            case (_, _, true): return 2
            default : return 1
            }
        case Style.Tertiary:
            switch (isDisabled, isPressed, isFocused) {
            case (true, _, _): return 1
            case (_, true, _): return 1
            case (_, _, true): return 2
            default : return 1
            }
        }
    }
    
    enum Style {
        case Primary
        case Secondary
        case Tertiary
    }
    
    enum Size {
        case Large
        case Medium
        case Small
    }
    
}
