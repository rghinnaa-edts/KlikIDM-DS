//
//  SliderView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 15/01/25.
//

import SwiftUI

struct SliderView: View {
    let tabhome = [
        KlikIDMTabs.Tab(icon: "grocery", title: "Grocery", badge: ""),
        KlikIDMTabs.Tab(icon: "food", title: "Food", badge: ""),
        KlikIDMTabs.Tab(icon: "card", title: "Virtual", badge: "")
    ]
    
    @State private var isLoading = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                KlikIDMTabs(
                    type: KlikIDMTabs.TabType.home_new,
                    tabs: tabhome
                )
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                .background(Color.blue50)
                .padding(.top, 12)
                
                KlikIDMSearch(
                    animation: KlikIDMSearch.Animation.append,
                    action: {})
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                VStack(spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Dikirim ke ")
                            .font(KlikIDMFont.Body.B3.Small)
                            .foregroundColor(Color.grey40)
                        Button(action: {}) {
                            Text("Mediterania Garden Residence")
                                .font(KlikIDMFont.Body.B3.Large)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .foregroundColor(Color.grey60)
                                .frame(maxWidth: 175)
                            Image("chevron-down")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color.grey50)
                                .frame(width: 16, height: 16)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image("question")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color.grey50)
                                .frame(width: 16, height: 16)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                    
                    KlikIDMSlider(action: {
                        isLoading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    })
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                if isLoading {
                    SkeletonView()
                } else {
                    Image("bg_home")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                }
            }.background(Color.grey10)
        }
    }
}

#Preview {
    SliderView()
}
