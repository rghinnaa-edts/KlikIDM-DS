//
//  CheckboxView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 28/11/24.
//

import SwiftUI

struct CheckboxView: View {
    @State var isChecked: Bool = false
    @State var isChecked2: Bool = false
    @State var isChecked3: Bool = false
    @State var isChecked4: Bool = false
    @State var isChecked5: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            isChecked: $isChecked
                        )
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            subtitle: "Body text goes here",
                            isIndeterminated: true,
                            isChecked: $isChecked3
                        )
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            subtitle: "Body text goes here",
                            isChecked: $isChecked2
                        )
                    }
                    .padding(12)
                    VStack(alignment: .leading) {
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            subtitle: "Body text goes here",
                            isDisable: true,
                            isChecked: $isChecked4
                        )
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            subtitle: "Body text goes here",
                            isDisable: true,
                            isIndeterminated: true,
                            isChecked: $isChecked5
                        )
                        KlikIDMCheckbox(
                            text: "Title checkboxes",
                            subtitle: "Body text goes here",
                            isDisable: true,
                            isChecked: $isChecked5
                        )
                    }
                    .padding(12)
                }
            }.navigationTitle("CheckBox")
        }
    }
}

#Preview {
    CheckboxView()
}
