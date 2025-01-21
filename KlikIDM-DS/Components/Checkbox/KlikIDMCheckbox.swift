//
//  KlikIDMCheckbox.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 28/11/24.
//

import SwiftUI

struct KlikIDMCheckbox: View {
    var text: String? = nil
    var subtitle: String? = nil
    var isDisable: Bool? = false
    var isIndeterminated: Bool? = false
    var onCheckedChanged: ((Bool) -> Void)?
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Checkbox()
            CheckboxLabel()
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
        
    func Checkbox() -> some View {
        ZStack {
            if isChecked {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isDisable ?? false ? Color.grey30 : Color.blue50, lineWidth: 1)
                    .fill(isDisable ?? false ? Color.grey20 : Color.blue50)
                    .frame(width: 22, height: 22)
                
                if isIndeterminated == true {
                    Path { path in
                        path.move(to: CGPoint(x: 6, y: 11))
                        path.addLine(to: CGPoint(x: 16, y: 11))
                    }
                    .stroke(isDisable ?? false ? Color.grey40 : Color.whiteIDM, lineWidth: 1.5)
                    .animation(.easeInOut, value: isChecked)
                    .frame(width: 22, height: 22)
                } else {
                    Path { path in
                        path.move(to: CGPoint(x: 6, y: 11))
                        path.addLine(to: CGPoint(x: 9.5, y: 15))
                        path.addLine(to: CGPoint(x: 16, y: 7))
                    }
                    .stroke(isDisable ?? false ? Color.grey40 : Color.whiteIDM, lineWidth: 1.5)
                    .animation(.easeInOut, value: isChecked)
                    .frame(width: 22, height: 22)
                }
            } else {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.grey30, lineWidth: 1)
                    .if(isDisable == true) { view in
                        view.fill(Color.grey20)
                    }
                    .frame(width: 22, height: 22)
            }
        }
    }
    
    func CheckboxLabel() -> some View {
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
