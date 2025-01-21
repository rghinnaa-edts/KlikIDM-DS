//
//  KlikIDMRadioButton.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 10/12/24.
//

import SwiftUI

struct KlikIDMRadioButton: View {
    var text: String? = nil
    var subtitle: String? = nil
    var isDisable: Bool? = false
    var onCheckedChanged: ((Bool) -> Void)?
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            RadioButton()
            RadioButtonLabel()
        }
        .onTapGesture {
            withAnimation {
                if isDisable == false {
                    isChecked.toggle()
                    onCheckedChanged?(isChecked)
                }
            }
        }
    }
    
    func RadioButton() -> some View {
        ZStack {
            if isChecked {
                Circle()
                    .stroke(isDisable ?? false ? Color.grey40 : Color.blue50, lineWidth: 1)
                    .fill(isDisable ?? false ? Color.grey20 : Color.blue50)
                    .frame(width: 22, height: 22)
                Circle()
                    .fill(isDisable ?? false ? Color.grey40 : Color.whiteIDM)
                    .frame(width: 10, height: 10)
            } else {
                Circle()
                    .stroke(Color.grey30, lineWidth: 1)
                    .if(isDisable == true) { view in
                        view.fill(Color.grey20)
                    }
                    .frame(width: 22, height: 22)
            }
        }
    }
    
    func RadioButtonLabel() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if(text != nil) {
                Text(text ?? "")
                    .font(KlikIDMFont.Body.B2.Medium)
                    .foregroundColor(isDisable ?? false ? Color.grey40 : Color.grey60)
                    .padding(.leading, 10)
                if(subtitle != nil) {
                    Text(subtitle ?? "")
                        .font(KlikIDMFont.Body.B3.Small)
                        .foregroundColor(isDisable ?? false ? Color.grey30 : Color.grey50)
                        .padding(EdgeInsets(top: 4, leading: 10, bottom: 0, trailing: 0))
                }
            }
        }
    }
}
