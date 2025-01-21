//
//  ChipsView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 03/12/24.
//

import SwiftUI

struct ChipsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    KlikIDMChips(
                        text: "Chips",
                        style: KlikIDMChips.Style.suggestion,
                        action: {})
                    KlikIDMChips(
                        text: "Chips",
                        style: KlikIDMChips.Style.filter,
                        action: {})
                }
            }.navigationTitle("Chips")
        }
    }
}

#Preview {
    ChipsView()
}
