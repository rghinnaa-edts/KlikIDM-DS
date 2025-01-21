//
//  KlikIDMSlider.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 15/01/25.
//

import SwiftUI

struct KlikIDMSlider: View {
    var action: () -> Void
    
    @State var isActive: Bool = true
    
    var body: some View {
        SliderHome()
    }
    
    func SliderHome() -> some View {
        ZStack(alignment: isActive ? .leading : .trailing) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(isActive ? Color.Brand.xpress : Color.Brand.xtra)
                .frame(maxWidth: UIScreen.main.bounds.width / 2 - 16)
                .shadow(radius: 1)
                .animation(.spring(duration: 0.3, bounce: 0.2) , value: isActive)
            
            HStack(spacing: 0) {
                Button(action: {
                    isActive = true
                    action()
                }) {
                    HStack(alignment: .top, spacing: 0) {
                        Image("xpress")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(isActive ? Color.whiteIDM : Color.grey60)
                            .frame(width: 16, height: 16)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Belanja Xpress")
                                .font(KlikIDMFont.Heading.H3)
                                .foregroundColor(isActive ? Color.whiteIDM : Color.grey60)
                            Text("Estimasi Tiba hari ini")
                                .font(KlikIDMFont.Body.B4.Small)
                                .foregroundColor(isActive ? Color.whiteIDM : Color.grey40)
                                .padding(.top, 2)
                        }
                        .padding(.leading, 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    isActive = false
                    action()
                }) {
                    HStack(alignment: .top, spacing: 0) {
                        Image("xtra")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(!isActive ? Color.whiteIDM : Color.grey60)
                            .frame(width: 16, height: 16)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Belanja Xtra")
                                .font(KlikIDMFont.Heading.H3)
                                .foregroundColor(!isActive ? Color.whiteIDM : Color.grey60)
                            Text("Estimasi Tiba 1-3 hari")
                                .font(KlikIDMFont.Body.B4.Small)
                                .foregroundColor(!isActive ? Color.whiteIDM : Color.grey40)
                                .padding(.top, 2)
                        }
                        .padding(.leading, 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.grey20))
    }
}
