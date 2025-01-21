//
//  ToastView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 11/12/24.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    KlikIDMToast(
                        text: "Label is the default for text.",
                        buttonText: "Button",
                        icon: "placeholder",
                        state: KlikIDMToast.State.Info,
                        action: {}
                    )
                    KlikIDMToast(
                        text: "Label is the default for text.",
                        buttonText: "Button",
                        icon: "placeholder",
                        state: KlikIDMToast.State.Error,
                        action: {}
                    )
                }.frame(maxWidth: .infinity)
            }.navigationTitle("Toast")
        }
    }
}

#Preview {
    ToastView()
}
