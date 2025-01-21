//
//  ContentViewItem.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 14/11/24.
//

import SwiftUI

struct ColorViewItem: View {
    var title: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color.blackIDM)
            Rectangle()
                .frame(height: 50)
                .foregroundColor(color)
                .cornerRadius(12)
                .shadow(radius: 4)
        }
    }
}

#Preview {
    ColorViewItem(title: "Test", color: Color.white)
}
