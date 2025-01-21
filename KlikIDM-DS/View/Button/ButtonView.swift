//
//  Button.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 18/11/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                    KlikIDMButton(text: "Button",
                                  style: KlikIDMButton.Style.Primary,
                                  size: KlikIDMButton.Size.Large,
                                  iconType: KlikIDMButton.IconType.NoIcon,
                                  isDisabled: false,
                                  action: {})
                    KlikIDMButton(text: "Button",
                                  style: KlikIDMButton.Style.Primary,
                                  size: KlikIDMButton.Size.Large,
                                  iconType: KlikIDMButton.IconType.IconLeading,
                                  isDisabled: false,
                                  icon: "placeholder",
                                  action: {})
                    KlikIDMButton(text: "Button",
                                  style: KlikIDMButton.Style.Primary,
                                  size: KlikIDMButton.Size.Large,
                                  iconType: KlikIDMButton.IconType.IconTrailing,
                                  isDisabled: false,
                                  icon: "placeholder",
                                  action: {})
                    KlikIDMButton(text: "Button",
                                  style: KlikIDMButton.Style.Secondary,
                                  size: KlikIDMButton.Size.Large,
                                  iconType: KlikIDMButton.IconType.NoIcon,
                                  isDisabled: false,
                                  action: {})
                    KlikIDMButton(text: "Button",
                                  style: KlikIDMButton.Style.Tertiary,
                                  size: KlikIDMButton.Size.Large,
                                  iconType: KlikIDMButton.IconType.NoIcon,
                                  isDisabled: false,
                                  action: {})
                    KlikIDMIconButton(style: KlikIDMIconButton.Style.Primary,
                                      size: KlikIDMIconButton.Size.Large,
                                      isDisabled: false,
                                      icon: "placeholder",
                                      action: {} )
                    KlikIDMIconButton(style: KlikIDMIconButton.Style.Secondary,
                                      size: KlikIDMIconButton.Size.Large,
                                      isDisabled: false,
                                      icon: "placeholder",
                                      action: {} )
                    KlikIDMIconButton(style: KlikIDMIconButton.Style.Tertiary,
                                      size: KlikIDMIconButton.Size.Large,
                                      isDisabled: false,
                                      icon: "placeholder",
                                      action: {} )
                    KlikIDMStepperButton(actionIncreased: {},
                                         actionDecreased: {},
                                         style: KlikIDMStepperButton.Style.Blue)
                    KlikIDMStepperButton(actionIncreased: {},
                                         actionDecreased: {},
                                         style: KlikIDMStepperButton.Style.White)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .navigationTitle("Button")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ButtonView()
}
