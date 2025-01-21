//
//  ProgressBarView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 10/01/25.
//

import SwiftUI

struct ProgressBarView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    KlikIDMProgressBar()
                }
            }.navigationTitle("Progress Bar")
        }
    }
}

#Preview {
    ProgressBarView()
}
