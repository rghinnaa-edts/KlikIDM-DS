//
//  Untitled.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 20/01/25.
//

import SwiftUI

struct KlikIDMSkeleton: View {
    @State private var isShimmering = false
    let cornerRadius: CGFloat = 8
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.gray.opacity(0.2),
                            Color.gray.opacity(0.3),
                            Color.gray.opacity(0.2)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color.white.opacity(0),
                                    Color.white.opacity(0.5),
                                    Color.white.opacity(0)
                                ]
                            ),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .offset(x: isShimmering ? 200 : -200)
            )
            .onAppear {
                withAnimation(
                    .linear(duration: 1.5)
                    .repeatForever(autoreverses: false)
                ) {
                    isShimmering = true
                }
            }
    }
}
