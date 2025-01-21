//
//  KlikIDMAlertbox.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 02/12/24.
//

import SwiftUI

struct KlikIDMAlertbox: View {
    var text: String
    var buttonText: String
    var style: KlikIDMAlertbox.Style
    var action: () -> Void
    
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            alertBox()
        }
    }
    
    func alertBox() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Image(icon(style))
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor(style))
                Text(text)
                    .font(KlikIDMFont.Paragraph.P2.Small)
                    .foregroundColor(Color.grey60)
                    .padding(.leading, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button( action: {
                    withAnimation {
                        isVisible = false
                    }
                } ) {
                    Image("x-close")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 16, height: 16)
                        .padding(.leading, 8)
                        .foregroundColor(Color.grey50)
                }
            }.padding(.bottom, 8)
            KlikIDMButton(
                text: buttonText,
                style: KlikIDMButton.Style.Primary,
                size: KlikIDMButton.Size.Small,
                iconType: KlikIDMButton.IconType.NoIcon,
                isDisabled: false,
                action: action )
        }.padding(12)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor(style))
                .stroke(strokeColor(style), lineWidth: 1))
    }
    
    func icon(_ style: Style) -> String {
        switch style {
        case Style.InfoGrey,
            Style.InfoBlue: return "information"
        case Style.Success: return "success"
        case Style.Error: return "error"
        case Style.Warning: return "attention"
        }
    }
    
    func backgroundColor(_ style: Style) -> Color {
        switch style {
        case Style.InfoGrey: return Color.grey10
        case Style.InfoBlue: return Color.blue10
        case Style.Success: return Color.successWeak
        case Style.Error: return Color.errorWeak
        case Style.Warning: return Color.warningWeak
        }
    }
    
    func strokeColor(_ style: Style) -> Color {
        switch style {
        case Style.InfoGrey: return Color.grey30
        case Style.InfoBlue: return Color.blue50
        case Style.Success: return Color.successStrong
        case Style.Error: return Color.errorStrong
        case Style.Warning: return Color.warningStrong
        }
    }

    func iconColor(_ style: Style) -> Color {
        switch style {
        case Style.InfoGrey: return Color.grey50
        case Style.InfoBlue: return Color.blue50
        case Style.Success: return Color.successStrong
        case Style.Error: return Color.errorStrong
        case Style.Warning: return Color.warningStrong
        }
    }
    
    enum Style {
        case InfoGrey
        case InfoBlue
        case Success
        case Error
        case Warning
    }
}
