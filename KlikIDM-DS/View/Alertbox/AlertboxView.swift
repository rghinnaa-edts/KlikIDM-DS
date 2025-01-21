//
//  AlertboxView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 02/12/24.
//

import SwiftUI

struct AlertboxView: View {
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    KlikIDMAlertbox(
                        text: "If the text has 2 rows, make sure the icons is always aligned to the top.",
                        buttonText: "Button",
                        style: KlikIDMAlertbox.Style.InfoGrey,
                        action: {}
                    )
                    KlikIDMAlertbox(
                        text: "If the text has 2 rows, make sure the icons is always aligned to the top.",
                        buttonText: "Button",
                        style: KlikIDMAlertbox.Style.InfoBlue,
                        action: {}
                    )
                    KlikIDMAlertbox(
                        text: "If the text has 2 rows, make sure the icons is always aligned to the top.",
                        buttonText: "Button",
                        style: KlikIDMAlertbox.Style.Success,
                        action: {}
                    )
                    KlikIDMAlertbox(
                        text: "If the text has 2 rows, make sure the icons is always aligned to the top.",
                        buttonText: "Button",
                        style: KlikIDMAlertbox.Style.Error,
                        action: {}
                    )
                    KlikIDMAlertbox(
                        text: "If the text has 2 rows, make sure the icons is always aligned to the top.",
                        buttonText: "Button",
                        style: KlikIDMAlertbox.Style.Warning,
                        action: {}
                    )
                }
                .navigationTitle("Alertbox")
                .padding()
            }
        }
    }
}

#Preview {
    AlertboxView()
}
