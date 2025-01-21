//
//  RadioButtonView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 10/12/24.
//

import SwiftUI

struct RadioButtonView: View {
    @State var isChecked: Bool = false
    @State var isChecked2: Bool = true
    @State var isChecked3: Bool = false
    @State var isChecked4: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack {
                        KlikIDMRadioButton(
                            text: "Title radio button",
                            isChecked: $isChecked
                        )
                        KlikIDMRadioButton(
                            text: "Title radio button",
                            subtitle: "Body text goes here",
                            isChecked: $isChecked2
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    VStack {
                        KlikIDMRadioButton(
                            text: "Title radio button",
                            subtitle: "Body text goes here",
                            isDisable: true,
                            isChecked: $isChecked3
                        )
                        KlikIDMRadioButton(
                            text: "Title radio button",
                            subtitle: "Body text goes here",
                            isDisable: true,
                            isChecked: $isChecked4
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                }
            }.navigationTitle("Radio Button")
        }
    }
}

#Preview {
    RadioButtonView()
}
