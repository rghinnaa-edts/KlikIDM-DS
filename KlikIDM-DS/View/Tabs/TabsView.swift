//
//  TabsView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 12/12/24.
//

import SwiftUI

struct TabsView: View {
    let tabhome = [
        KlikIDMTabs.Tab(icon: "grocery", title: "Grocery", badge: ""),
        KlikIDMTabs.Tab(icon: "food", title: "Food", badge: ""),
        KlikIDMTabs.Tab(icon: "card", title: "Virtual", badge: "")
    ]
    
    let tabcategory = [
        KlikIDMTabs.Tab(icon: "", title: "Tab", badge: "0"),
        KlikIDMTabs.Tab(icon: "", title: "Tab", badge: "0"),
        KlikIDMTabs.Tab(icon: "", title: "Tab", badge: "0"),
        KlikIDMTabs.Tab(icon: "", title: "Tab", badge: "0"),
        KlikIDMTabs.Tab(icon: "", title: "Tab", badge: "0")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.cart,
                        tabs: []
                    )
                    
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.home,
                        tabs: tabhome
                    )
                    .padding(8)
                    .background(Color.blue50)
                    
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.category,
                        tabs: tabcategory
                    )
                    .padding(8)
                    
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.home_new,
                        tabs: tabhome
                    )
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.blue50)
                    .padding(.top, 12)
                    
                    KlikIDMTabs(
                        type: KlikIDMTabs.TabType.home_new2,
                        tabs: tabhome
                    )
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.blue50)
                    .padding(.top, 12)
                }
            }
        }
    }
}

#Preview {
    TabsView()
}
