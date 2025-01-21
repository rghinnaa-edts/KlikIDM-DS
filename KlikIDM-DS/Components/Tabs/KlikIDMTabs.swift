//
//  KlikIDMTabs.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 12/12/24.
//

import SwiftUI

struct KlikIDMTabs: View {
    var type: TabType
    var tabs: [Tab]
    var isDisabled: Bool? = false
    
    @State var isActive: Bool = true
    @State var selectedTabHome: Int = 0
    @State var selectedTabHomeNew: Int = 0
    @State var selectedTabCategory: Int = 0
    @State private var isPressed = false
    @State private var isLongPressed = false
    @State private var pressedIndex: Int?
//    @FocusState private var isFocused: Bool
    @FocusState private var focusedTab: Int?
    
    var body: some View {
        switch type {
        case .cart: TabCart()
        case .home: TabHome()
        case .category: TabCategory()
        case .home_new: TabHomeNew()
        case .home_new2: TabHomeNewZoom()
        default: TabHome()
        }
    }
    
    func TabCart() -> some View {
        ZStack(alignment: isActive ? .leading : .trailing) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(isActive ? Color.Brand.xpress : Color.Brand.xtra)
                .frame(maxWidth: UIScreen.main.bounds.width / 2 - 8)
                .shadow(radius: 1)
                .animation(.smooth(duration: 0.3), value: isActive)
            
            HStack(spacing: 0) {
                Button(action: {
                    isActive = true
                }) {
                    HStack(spacing: 0) {
                        Image("xpress")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(isActive ? Color.whiteIDM : Color.grey40)
                            .frame(width: 16, height: 16)
                        Text("Belanja Xpress")
                            .font(KlikIDMFont.Heading.H3)
                            .foregroundColor(isActive ? Color.whiteIDM : Color.grey40)
                            .padding(8)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    isActive = false
                }) {
                    HStack(spacing: 0) {
                        Image("xtra")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(!isActive ? Color.whiteIDM : Color.grey40)
                            .frame(width: 16, height: 16)
                        Text("Belanja Xtra")
                            .font(KlikIDMFont.Heading.H3)
                            .foregroundColor(!isActive ? Color.whiteIDM : Color.grey40)
                            .padding(8)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(RoundedRectangle(cornerRadius: 100)
            .fill(Color.grey20)
            .stroke(Color.grey30, lineWidth: 1))
        .padding(4)
    }
    
    func TabHome() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(Color.whiteIDM)
                .frame(maxWidth: UIScreen.main.bounds.width / CGFloat(tabs.count) - 8)
                .padding(.leading, CGFloat(selectedTabHome) * (UIScreen.main.bounds.width / CGFloat(tabs.count) - 8))
                .shadow(radius: 1)
                .animation(.smooth(duration: 0.3), value: selectedTabHome)
            
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button(action: {
                        selectedTabHome = index
                    }) {
                        HStack(spacing: 0) {
                            Image(tabs[index].icon)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(selectedTabHome == index ? Color.blue50 : Color.whiteIDM)
                                .frame(width: 16, height: 16)
                                .padding(.trailing, 4)
                            Text(tabs[index].title)
                                .font(KlikIDMFont.Heading.H3)
                                .foregroundColor(selectedTabHome == index ? Color.blue50 : Color.whiteIDM)
                        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(RoundedRectangle(cornerRadius: 100)
            .fill(Color.blueTab.opacity(0.3)))
        .padding(4)
    }
    
    
    func TabHomeNewZoom() -> some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.grey10)
                        .frame(maxWidth: .infinity)
                }
                
                ZStack() {
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Button(action: {
                                selectedTabHomeNew = index
                            }) {
                                VStack(spacing: 0) {
                                    HStack(spacing: 0) {
                                        Image("")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                            .frame(width: 16, height: 16)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                        Text("")
                                            .font(KlikIDMFont.Heading.H3)
                                            .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                    }
                                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                }
                                
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 0)
                                        .cornerRadius(TabCornerSize(index, false), corners: TabCornerVisibility(index, false))
                                        .foregroundColor(backgroundColor(index, false))
                                        .animation(.easeInOut(duration: 0.2).delay(0.15), value: selectedTabHomeNew)
                                )
                                
                                if(index == 1) {
                                    Button(action: {
                                        selectedTabHomeNew = index
                                    }) {
                                        VStack(spacing: 0) {
                                            HStack(spacing: 0) {
                                                Image(tabs[index].icon)
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                                    .frame(width: 16, height: 16)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                                Text(tabs[index].title)
                                                    .font(KlikIDMFont.Heading.H3)
                                                    .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                            }
                                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .background(
                                                RoundedRectangle(cornerRadius: 0)
                                                    .cornerRadius(TabCornerSize(index, true), corners: TabCornerVisibility(index, true))
                                                    .foregroundColor(backgroundColor(index, true))
                                                    .animation(.easeInOut(duration: 0.2).delay(0.18), value: selectedTabHomeNew)
                                        )
                                    }
                                    .buttonStyle(CustomTabButton())
                                    .simultaneousGesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { _ in pressedIndex = index }
                                            .onEnded { _ in pressedIndex = nil }
                                    )
                                }
                            }.buttonStyle(CustomTabButton())
                        }
                    }
                    
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Button(action: {
                                selectedTabHomeNew = index
                            }) {
                                VStack(spacing: 0) {
                                    HStack(spacing: 0) {
                                        Image(tabs[index].icon)
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                            .frame(width: 16, height: 16)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                        Text(tabs[index].title)
                                            .font(KlikIDMFont.Heading.H3)
                                            .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                    }
                                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)

                            }
                            .buttonStyle(CustomTextButton())
                        }
                    }
                }
                
                ZStack() {
                    RoundedRectangle(cornerRadius: 0)
                        .cornerRadius(12, corners: [.topLeft, .topRight])
                        .foregroundColor(Color.grey10)
                        .frame(maxWidth: UIScreen.main.bounds.width / CGFloat(tabs.count))
                        .animation(.smooth(duration: 0.2), value: selectedTabHomeNew)
                    HStack(spacing: 0) {
                        Image(tabs[selectedTabHomeNew].icon)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(Color.blue50)
                            .frame(width: 16, height: 16)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                        Text(tabs[selectedTabHomeNew].title)
                            .font(KlikIDMFont.Heading.H3)
                            .foregroundColor(Color.blue50)
                    }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                }
                .padding(.leading, TabPaddingHome())
            }
            .frame(maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: 0)
                .cornerRadius(28, corners: TabEndCornerVisibility())
                .animation(.easeInOut(duration: 0.3), value: selectedTabHomeNew)
                .foregroundColor(Color.grey10)
                .frame(height: 32)
        }
    }
    
    struct CustomTabButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(configuration.isPressed ? Color.white.opacity(0.3) : Color.blue50)
                .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    struct CustomTextButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1.08 : 1.0)
                .foregroundColor(configuration.isPressed ? Color.blue50.opacity(0.85) : Color.blue50)
                .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        }
    }

    func TabHomeNew2() -> some View {
        ZStack() {
            VStack(spacing: 0) {
                ZStack() {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.blue50)
                            .frame(maxWidth: .infinity)
                        Rectangle()
                            .fill(Color.whiteIDM)
                            .frame(maxWidth: .infinity)
                    }
                    
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Button(action: {
                                selectedTabHomeNew = index
                            }) {
                                ZStack() {
                                    RoundedRectangle(cornerRadius: 0)
                                        .if(selectedTabHomeNew == index) { view in
                                            view.cornerRadius(18, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                                        }
                                        .if(selectedTabHomeNew == 0 && index == 1) { view in
                                            view.cornerRadius(18, corners: [.bottomLeft])
                                        }
                                        .if(selectedTabHomeNew == (tabs.count-1) && index == (tabs.count-2)) { view in
                                            view.cornerRadius(18, corners: [.bottomRight])
                                        }
                                        .if((selectedTabHomeNew != 0 && selectedTabHomeNew != (tabs.count-1)) && index == (selectedTabHomeNew+1)) { view in
                                            view.cornerRadius(18, corners: [.bottomLeft])
                                        }
                                        .if((selectedTabHomeNew != 0 && selectedTabHomeNew != (tabs.count-1)) && index == (selectedTabHomeNew-1)) { view in
                                            view.cornerRadius(18, corners: [.bottomRight])
                                        }
                                        .foregroundColor(selectedTabHomeNew == index ? Color.whiteIDM : Color.blue50)
                                        .frame(maxWidth: .infinity)
                                        .animation(.smooth(duration: 0.3), value: selectedTabHomeNew)
                                    HStack(spacing: 0) {
                                        Image(tabs[index].icon)
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                            .frame(width: 16, height: 16)
                                            .padding(.trailing, 4)
                                        Text(tabs[index].title)
                                            .font(KlikIDMFont.Heading.H3)
                                            .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                    }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                }
                            }.frame(maxWidth: .infinity)
                        }
                    }
                }
                
                RoundedRectangle(cornerRadius: 0)
                    .cornerRadius(TabEndCornerSize(), corners: TabEndCornerVisibility())
                    .foregroundColor(Color.whiteIDM)
                    .frame(height: 32)
            }
        }
    }
    
    func TabCategory() -> some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                Button(action: {
                    selectedTabCategory = index
                }) {
                    HStack(spacing: 0) {
                        Text(tabs[index].title)
                            .font(KlikIDMFont.Body.B2.Large)
                            .foregroundColor(Color.blue50)
                            .if(selectedTabCategory == index) { view in
                                view.background(
                                    GeometryReader { geometry in
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color.blue50)
                                            .frame(width: geometry.size.width, height: 2)
                                            .offset(y: 24)
                                    }
                                )
                            }
                            .padding(.trailing, 4)
                        
                        Text(tabs[index].badge)
                            .font(KlikIDMFont.Body.B4.Large)
                            .foregroundColor(Color.whiteIDM)
                            .padding(4)
                            .background(
                                Circle()
                                    .fill(Color.blue50)
                            )
                    }
                    .padding(.trailing, 8)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func HomeTab(_ index: Int) -> Alignment {
        switch index {
        case 0: return .leading
        case (tabs.count-1): return .trailing
        default: return .center
        }
    }
    
    func TabHomeNew() -> some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.grey10)
                        .frame(maxWidth: .infinity)
                }
                
                ZStack() {
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            ZStack() {
                                if(index == 1) {
                                    Button(action: {
                                        selectedTabHomeNew = index
                                    }) {
                                        ZStack() {
                                            HStack(spacing: 0) {
                                                RoundedRectangle(cornerRadius: 0)
                                                    .cornerRadius(TabCornerSize(index, false), corners: TabCornerVisibility(index, false))
                                                    .foregroundColor(backgroundColor(index, false))
                                                    .animation(.easeInOut(duration: 0.4), value: selectedTabHomeNew)
                                                Rectangle()
                                                    .fill(bgColor(index, false))
                                                    .frame(maxWidth: .infinity)
                                            }
                                            
                                            VStack(spacing: 0) {
                                                HStack(spacing: 0) {
                                                    Image(tabs[index].icon)
                                                        .resizable()
                                                        .renderingMode(.template)
                                                        .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                                        .frame(width: 16, height: 16)
                                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                                    Text(tabs[index].title)
                                                        .font(KlikIDMFont.Heading.H3)
                                                        .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.blue20)
                                                }
                                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                    }
                                    .buttonStyle(CustomTabButton())
                                    .simultaneousGesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { _ in pressedIndex = index }
                                            .onEnded { _ in pressedIndex = nil }
                                    )
                                }
                                
                                if index == 1 {
                                    Button(action: {
                                        selectedTabHomeNew = index
                                    }) {
                                        ZStack() {
                                            HStack(spacing: 0) {
                                                Rectangle()
                                                    .fill(bgColor(index, true))
                                                    .frame(maxWidth: .infinity)
                                                RoundedRectangle(cornerRadius: 0)
                                                    .cornerRadius(TabCornerSize(index, true), corners: TabCornerVisibility(index, true))
                                                    .foregroundColor(backgroundColor(index, true))
                                                    .animation(.easeInOut(duration: 0.4), value: selectedTabHomeNew)
                                                    .frame(maxWidth: .infinity)
                                            }
                                            
                                            VStack(spacing: 0) {
                                                HStack(spacing: 0) {
                                                    Image(tabs[index].icon)
                                                        .resizable()
                                                        .renderingMode(.template)
                                                        .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                                        .frame(width: 16, height: 16)
                                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                                    Text(tabs[index].title)
                                                        .font(KlikIDMFont.Heading.H3)
                                                        .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.blue20)
                                                }
                                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                            }
                                            .frame(maxWidth: .infinity)
                                        }
                                    }
                                    .buttonStyle(CustomTabButton())
                                    .simultaneousGesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { _ in pressedIndex = index }
                                            .onEnded { _ in pressedIndex = nil }
                                    )
                                } else {
                                    Button(action: {
                                        selectedTabHomeNew = index
                                    }) {
                                        VStack(spacing: 0) {
                                            HStack(spacing: 0) {
                                                Image(tabs[index].icon)
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundStyle(selectedTabHomeNew == index ? Color.blue50 : Color.whiteIDM)
                                                    .frame(width: 16, height: 16)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                                                Text(tabs[index].title)
                                                    .font(KlikIDMFont.Heading.H3)
                                                    .foregroundColor(selectedTabHomeNew == index ? Color.blue50 : Color.blue20)
                                            }
                                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .background(
                                                RoundedRectangle(cornerRadius: 0)
                                                    .cornerRadius(TabCornerSize(index, true), corners: TabCornerVisibility(index, true))
                                                    .foregroundColor(backgroundColor(index, true))
                                                    .animation(.easeInOut(duration: 0.4), value: selectedTabHomeNew)
                                        )
                                    }
                                    .buttonStyle(CustomTabButton())
                                    .simultaneousGesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { _ in pressedIndex = index }
                                            .onEnded { _ in pressedIndex = nil }
                                    )
                                }
                            }
                        }
                    }
                }
                
                ZStack() {
                    RoundedRectangle(cornerRadius: 0)
                        .cornerRadius(12, corners: [.topLeft, .topRight])
                        .foregroundColor(Color.grey10)
                        .frame(maxWidth: UIScreen.main.bounds.width / CGFloat(tabs.count))
                        .animation(.easeInOut(duration: 0.2), value: selectedTabHomeNew)
                    HStack(spacing: 0) {
                        Image(tabs[selectedTabHomeNew].icon)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(Color.blue50)
                            .frame(width: 16, height: 16)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                        Text(tabs[selectedTabHomeNew].title)
                            .font(KlikIDMFont.Heading.H3)
                            .foregroundColor(Color.blue50)
                    }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 2))
                }
                .padding(.leading, TabPaddingHome())
            }
            .frame(maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: 0)
                .cornerRadius(28, corners: TabEndCornerVisibility())
                .foregroundColor(Color.grey10)
                .frame(height: 28)
        }
    }
    
    func bgColor(_ index: Int, _ isTop: Bool) -> Color {
        let start = selectedTabHomeNew == 0 ? true : false
        let end = selectedTabHomeNew == tabs.count-1 ? true : false
        
        if pressedIndex == index {
            return isTop ? Color.blue50.opacity(0.88) : Color.white
        }
        
        if !isTop {
            if start && index == selectedTabHomeNew + 1 {
                return Color.blue50
            }
            if end && index == selectedTabHomeNew - 1 {
                return Color.clear
            }
        } else {
            if start && index == selectedTabHomeNew + 1 {
                return Color.clear
            }
            if end && index == selectedTabHomeNew - 1 {
                return Color.blue50
            }
        }
            
        return Color.blue50
    }
    
    func backgroundColor(_ index: Int, _ isTop: Bool) -> Color {
        let start = selectedTabHomeNew == 0 ? true : false
        let end = selectedTabHomeNew == tabs.count-1 ? true : false
        
        if pressedIndex == index {
            return isTop ? Color.blue50.opacity(0.88) : Color.white
        }
        
        if !isTop {
            if start && index == selectedTabHomeNew + 1 {
                return Color.blue50
            }
            if end && index == selectedTabHomeNew - 1 {
                return Color.blue50
            }
        } else {
            if start && index == selectedTabHomeNew + 1 {
                return Color.blue50
            }
            if end && index == selectedTabHomeNew - 1 {
                return Color.blue50
            }
        }
            
        return Color.blue50
    }
    
    func TabPaddingHome() -> CGFloat {
        if selectedTabHomeNew == 0 { return CGFloat(selectedTabHomeNew) * (UIScreen.main.bounds.width / CGFloat(tabs.count))}
        else { return CGFloat(selectedTabHomeNew) * (UIScreen.main.bounds.width / CGFloat(tabs.count)) }
    }
    
    func TabCornerSize(_ index: Int, _ isTop: Bool) -> CGFloat {
        let start = selectedTabHomeNew == 0 ? true : false
        let end = selectedTabHomeNew == tabs.count-1 ? true : false
        let mid = selectedTabHomeNew != 0 && selectedTabHomeNew != tabs.count - 1 ? true : false
        
        if start {
            if index == 1 && !isTop { return 12 }
            else { return 0 }
        }
        
        if end {
            if index == 1 && isTop { return 12 }
            else { return 0 }
        }
        
        if mid {
            if index == selectedTabHomeNew + 1 { return 12 }
            else if index == selectedTabHomeNew - 1 { return 12 }
            else { return 0 }
        }

        return 0
    }
    
    func TabCornerVisibility(_ index: Int, _ isTop: Bool) -> UIRectCorner {
        let start = selectedTabHomeNew == 0 ? true : false
        let end = selectedTabHomeNew == tabs.count-1 ? true : false
        let mid = selectedTabHomeNew != 0 && selectedTabHomeNew != tabs.count - 1 ? true : false
        
        if start {
            if index == 1 && !isTop { return [.bottomLeft] }
            if index != 0 || index != selectedTabHomeNew + 1 { return [] }
        }
        
        if end {
            if index == 1 && isTop { return [.bottomRight] }
            if index != tabs.count-1 || index != selectedTabHomeNew - 1 { return [] }
        }
        
        if mid {
            if index == selectedTabHomeNew + 1 { return [.bottomLeft] }
            else if index == selectedTabHomeNew - 1 { return [.bottomRight] }
            else { return [] }
        }
        
        return [.bottomLeft, .bottomRight]
    }
    
    func TabEndCornerSize() -> CGFloat {
        if selectedTabHomeNew == 0 {
            return 28
        } else if selectedTabHomeNew == tabs.count - 1 {
            return 28
        } else if selectedTabHomeNew != 0 && selectedTabHomeNew != tabs.count - 1 {
            return 28
        } else {
            return 0
        }
    }
    
    func TabEndCornerVisibility() -> UIRectCorner {
        if selectedTabHomeNew == 0 {
            return [.topRight]
        } else if selectedTabHomeNew == tabs.count - 1 {
            return [.topLeft]
        } else if selectedTabHomeNew != 0 && selectedTabHomeNew != tabs.count - 1 {
            return [.topLeft, .topRight]
        } else {
            return [.topLeft, .topRight]
        }
    }
    
    enum TabType {
        case cart
        case home
        case category
        case promo
        case home_new
        case home_new2
    }
    
    struct Tab {
        let icon: String
        let title: String
        let badge: String
    }
}
