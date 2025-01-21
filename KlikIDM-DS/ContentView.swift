//
//  ContentView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    
    struct DesignSystemItem: Identifiable {
        let id = UUID()
        let title: String
        let destination: AnyView
        
        init(_ title: String, _ destination: AnyView) {
            self.title = title
            self.destination = destination
        }
    }
    
    var itemsView: [DesignSystemItem] = [
        DesignSystemItem("Color", AnyView(ColorView())),
        DesignSystemItem("Typography", AnyView(TypographyView())),
        DesignSystemItem("AlertBox", AnyView(AlertboxView())),
        DesignSystemItem("Badge", AnyView(TypographyView())),
        DesignSystemItem("Button", AnyView(ButtonView())),
        DesignSystemItem("Card", AnyView(TypographyView())),
        DesignSystemItem("CheckBox", AnyView(CheckboxView())),
        DesignSystemItem("Chips", AnyView(ChipsView())),
        DesignSystemItem("Coachmark", AnyView(CoachmarkView())),
        DesignSystemItem("Dialog/PopUp", AnyView(DialogView())),
        DesignSystemItem("Header", AnyView(TypographyView())),
        DesignSystemItem("NavBar", AnyView(TypographyView())),
        DesignSystemItem("Notification", AnyView(TypographyView())),
        DesignSystemItem("Promo", AnyView(TypographyView())),
        DesignSystemItem("RadioButton", AnyView(RadioButtonView())),
        DesignSystemItem("Search", AnyView(SearchView())),
        DesignSystemItem("ProgressBar", AnyView(ProgressBarView())),
        DesignSystemItem("TextFields", AnyView(TextfieldView())),
        DesignSystemItem("Toast", AnyView(ToastView())),
        DesignSystemItem("Tabs", AnyView(TabsView())),
        DesignSystemItem("HomeTab", AnyView(HomeTabView())),
        DesignSystemItem("Slider", AnyView(SliderView()))
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(itemsView) { item in
                        NavigationLink(destination: item.destination) {
                            ContentViewItem(title: item.title)
                                .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        }
                    }
                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 8))
            }
            .background(Color.blue30)
            .navigationTitle("Klik IDM Design System")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
