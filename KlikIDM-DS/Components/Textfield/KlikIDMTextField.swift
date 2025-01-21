//
//  Textfield.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 26/11/24.
//

import SwiftUI

struct KlikIDMTextField: View {
    var label: String
    var placeholder: String
    var isRequired: Bool
    var hint: String? = nil
    var withCounter: Bool? = nil
    var maxLength: Int? = nil
    var iconType: IconType = IconType.NoIcon
    var icon: String? = nil
    var iconColor: Color? = nil
    var action: () -> Void
    
    @State var text: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        Textfield()
    }
    
    func Textfield() -> some View {
        VStack {
            HStack(spacing: 0) {
                if iconType == IconType.IconLeading || iconType == IconType.IconBoth { Icon() }
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Label")
                            .font(KlikIDMFont.Heading.H3)
                            .foregroundColor(Color.grey50)
                        if(isRequired) {
                            Text(" *")
                                .font(KlikIDMFont.Heading.H3)
                                .foregroundColor(Color.red30)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("", text: $text)
                        .font(KlikIDMFont.Body.B1.Small)
                        .foregroundColor(Color.grey70)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .focused($isFocused)
                        .padding(.top, 8)
                        .onChange(of: text) { _, newValue in
                            text = String(newValue.prefix(maxLength ?? 250))
                        }
                        .placeholder(when: text.isEmpty) {
                            Text("Placeholder Text")
                                .font(KlikIDMFont.Body.B1.Small)
                                .foregroundColor(Color.grey40)
                                .padding(.top, 8)
                        }
                }.padding(.horizontal, 8)
                
                if iconType == IconType.IconTrailing || iconType == IconType.IconBoth { Icon() }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(Color.whiteIDM)
                .stroke(isFocused ? Color.blue30 : Color.grey30, lineWidth: 1))
            
            HStack(spacing: 0) {
                if(hint != nil && hint != "") {
                    Text(hint ?? "")
                        .font(KlikIDMFont.Body.B4.Small)
                        .foregroundColor(Color.grey50)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                if(withCounter ?? false) {
                    Text("\(text.count)/\(maxLength ?? 250)")
                        .font(KlikIDMFont.Body.B4.Small)
                        .foregroundColor(Color.grey50)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }.padding(.top, 4)
        }
    }
    
    func Icon() -> some View {
        Image(icon ?? "placeholder")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Color.grey50)
            .frame(width: 24, height: 24)
    }
    
    enum IconType {
        case NoIcon
        case IconLeading
        case IconTrailing
        case IconBoth
    }
}
