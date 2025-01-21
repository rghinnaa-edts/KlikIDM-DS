//
//  TabsView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 12/12/24.
//

import SwiftUI

struct TabsViewNew: View {
    let tabhome = [
        KlikIDMTabs.Tab(icon: "grocery", title: "Grocery", badge: ""),
        KlikIDMTabs.Tab(icon: "food", title: "Food", badge: ""),
        KlikIDMTabs.Tab(icon: "card", title: "Virtual", badge: "")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.home_new,
                        tabs: tabhome
                    )
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.blue50)
                }
            }.background(Color.grey10)
        }
    }
}

#Preview {
    TabsViewNew()
}
