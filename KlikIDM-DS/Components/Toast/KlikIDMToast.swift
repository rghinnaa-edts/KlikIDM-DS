//
//  KlikIDMToast.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 11/12/24.
//

import SwiftUI

struct KlikIDMToast: View {
    var text: String
    var buttonText: String
    var icon: String
    var state: KlikIDMToast.State? = KlikIDMToast.State.Info
    var action: () -> Void
    
    var body: some View {
        Toast()
    }
    
    func Toast() -> some View {
        HStack(spacing: 0) {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.whiteIDM)
                .frame(width: 16, height: 16)
            Text(text)
                .font(KlikIDMFont.Body.B3.Small)
                .foregroundColor(Color.whiteIDM)
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: action) {
                Text(buttonText)
                    .font(KlikIDMFont.Button.Small)
                    .foregroundColor(Color.whiteIDM)
                    .padding(.leading, 8)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(BgColor(state ?? .Info))
                .shadow(radius: 4)
        )
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    
    func BgColor(_ state: KlikIDMToast.State) -> Color {
        if state == State.Info {
            return Color.grey60
        } else {
            return Color.Support.errorStrong
        }
    }
    
    enum State {
        case Info
        case Error
    }
}
