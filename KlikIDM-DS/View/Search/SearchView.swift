//
//  SearchView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 21/11/24.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    KlikIDMSearch(
                        animation: KlikIDMSearch.Animation.non,
                        action: {})
                    KlikIDMSearch(
                        animation: KlikIDMSearch.Animation.append,
                        action: {})
                    KlikIDMSearch(
                        animation: KlikIDMSearch.Animation.append_prefix,
                        action: {})
                    KlikIDMSearch(
                        animation: KlikIDMSearch.Animation.slide,
                        action: {})
                }.padding(12)
                    .frame(maxWidth: .infinity)
            }.navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
