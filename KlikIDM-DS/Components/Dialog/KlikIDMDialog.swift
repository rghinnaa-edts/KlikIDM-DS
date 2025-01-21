//
//  KlikIDMDialog.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 03/12/24.
//

import SwiftUI

struct KlikIDMDialog: View {
    @Binding var isPresented: Bool
        var title: String
        var description: String
        var primaryButtonText: String
        var primaryAction: () -> Void
        var secondaryButtonText: String?
        var secondaryAction: (() -> Void)?
    
    var body: some View {
        dialog()
    }
    
    func dialog() -> some View {
        ZStack {
            Color.black.opacity(isPresented ? 0.5 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text(title)
                            .font(KlikIDMFont.Heading.H1)
                            .foregroundColor(Color.grey70)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button( action: {
                            withAnimation {
                                isPresented = false
                            }
                        } ) {
                            Image("x-close")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 16, height: 16)
                                .padding(.leading, 8)
                                .foregroundColor(Color.grey50)
                        }
                    }.padding(.bottom, 16)
                    
                    Text(description)
                        .font(KlikIDMFont.Paragraph.P1.Small)
                        .foregroundColor(Color.grey50)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 36)
                    
                    KlikIDMButton(
                        text: primaryButtonText,
                        style: KlikIDMButton.Style.Primary,
                        size: KlikIDMButton.Size.Large,
                        iconType: KlikIDMButton.IconType.NoIcon,
                        action: primaryAction)
                    
                    if(secondaryButtonText != nil) {
                        KlikIDMButton(
                            text: secondaryButtonText ?? "",
                            style: KlikIDMButton.Style.Secondary,
                            size: KlikIDMButton.Size.Large,
                            iconType: KlikIDMButton.IconType.NoIcon,
                            action: secondaryAction ?? {})
                        .padding(.top, 8)
                    }
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                )
            }.padding(16)
        }
    }
}
