//
//  Textfield.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 26/11/24.
//

import SwiftUI

struct TextfieldView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: false,
                        iconType: KlikIDMTextField.IconType.NoIcon,
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        iconType: KlikIDMTextField.IconType.NoIcon,
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        iconType: KlikIDMTextField.IconType.IconLeading,
                        icon: "placeholder",
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        iconType: KlikIDMTextField.IconType.IconTrailing,
                        icon: "placeholder",
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        iconType: KlikIDMTextField.IconType.IconBoth,
                        icon: "placeholder",
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        withCounter: true,
                        iconType: KlikIDMTextField.IconType.IconLeading,
                        icon: "placeholder",
                        action: {})
                    KlikIDMTextField(
                        label: "Label",
                        placeholder: "Placeholder Text",
                        isRequired: true,
                        hint: "Email is Required",
                        withCounter: true,
                        iconType: KlikIDMTextField.IconType.IconLeading,
                        icon: "placeholder",
                        action: {})
                }
                    .navigationTitle("Text Fields")
                    .padding()
            }
        }
    }
}

#Preview {
    TextfieldView()
}
