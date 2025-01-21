//
//  KlikIDMChips.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 03/12/24.
//

import SwiftUI

struct KlikIDMChips: View {
    var text: String
    var style: KlikIDMChips.Style
    var action: () -> Void
    
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            if(isSelected) {
                isSelected = false
            } else {
                isSelected = true
            }
            
            action()
        }) {
            chips()
        }
    }
    
    func chips() -> some View {
        HStack(spacing: 0) {
            if(style == Style.suggestion) {
                Image("placeholder")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.blue50)
                    .padding(2)
                    .background(Circle().fill(isSelected ? Color.white : Color.grey20))
                    .padding(.trailing, 4)
            }
            
            Text(text)
                .font(fontStyle(style))
                .foregroundColor(fontColor(style))
            
            if(style == Style.filter) {
                Image("placeholder")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.grey50)
                    .padding(.leading, 4)
            }
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(isSelected ? Color.blue50 : Color.grey20)
                .if(style == Style.filter) { view in
                    view.fill(Color.whiteIDM)
                        .stroke(Color.grey30, lineWidth: 1)
                }
        )
    }
    
    func fontStyle(_ style: Style) -> KlikIDMFont.FontStyle {
        switch style {
        case .suggestion:
            return KlikIDMFont.Body.B3.Large
        case .filter:
            return KlikIDMFont.Body.B3.Small
        }
    }
    
    func fontColor(_ style: Style) -> Color {
        switch style {
        case .suggestion:
            return isSelected ? Color.whiteIDM : Color.blue50
        case .filter:
            return Color.grey50
        }
    }
    
    enum Style {
        case suggestion
        case filter
    }
}
