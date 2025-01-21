//
//  ColorView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 20/11/24.
//


import SwiftUI

struct ColorView: View {
    let colorManager = ColorManager()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(colorManager.categories, id: \.name) { category in
                    Section(header: Text(category.name).padding(.top, 24)) {
                        ForEach(category.colors, id: \.name) { color in
                            ColorViewItem(title: color.name, color: color.color)
                        }
                    }.padding(.horizontal, 12).frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    ColorView()
}
