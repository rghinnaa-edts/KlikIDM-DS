//
//  BottomBarView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 02/01/25.
//

import SwiftUI

struct BottomBarView: View {
    
    @State var selectedTab = 0
    let tabhome = [
        KlikIDMTabs.Tab(icon: "home", title: "Beranda", badge: ""),
        KlikIDMTabs.Tab(icon: "cart", title: "Keranjang", badge: ""),
        KlikIDMTabs.Tab(icon: "qr-code", title: "Poinku", badge: ""),
        KlikIDMTabs.Tab(icon: "transaction-list", title: "Pesanan", badge: ""),
        KlikIDMTabs.Tab(icon: "account", title: "Akun", badge: "")
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)

            CartView()
                .tag(1)

            PoinkuView()
                .tag(2)

            OrderView()
                .tag(3)

            AccountView()
                .tag(4)
        }
        
        HStack {
            ForEach(tabhome.indices, id: \.self) { index in
                if index != 2 {
                    Button {
                        selectedTab = index
                    } label: {
                        CustomTabItem(
                            image: tabhome[index].icon,
                            title: tabhome[index].title,
                            isActive: (selectedTab == index))
                    }
                } else {
                    Button {
                        selectedTab = index
                    } label: {
                        CustomCenterTabItem(
                            image: tabhome[index].icon,
                            title: tabhome[index].title,
                            isActive: (selectedTab == index))
                    }
                }
            }
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(Color.whiteIDM)
                .shadow(radius: 1)
        )
    }
}

#Preview {
    BottomBarView()
}

//    init() {
//        if let customFont = UIFont(name: "Inter-Regular", size: 10) {
//                    UITabBarItem.appearance().setTitleTextAttributes(
//                        [.font: customFont],
//                        for: .normal
//                    )
//                }
//    }

//        TabView {
//            HomeView()
//                .tabItem {
//                    Label("Beranda", image: "home")
//                }
//            CartView()
//                .tabItem {
//                    Label("Keranjang", image: "cart")
//                }
//
//            PoinkuView()
//                .tabItem {
//                    Label("Poinku", image: "")
//                }
//
//            OrderView()
//                .tabItem {
//                    Label("Pesanan", image: "transaction-list")
//                }
//            AccountView()
//                .tabItem {
//                    Label("Akun", image: "account")
//                }
//        }
