//
//  ContentViewItem.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 14/11/24.
//

import SwiftUI

struct ContentViewItem: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 4)
                .contentShape(Rectangle())
                .hoverEffect()
        }
    }
}

#Preview {
    ContentViewItem(title: "Test")
}
