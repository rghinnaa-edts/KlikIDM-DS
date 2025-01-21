//
//  SkeletonView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 20/01/25.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    KlikIDMSkeleton()
                        .frame(width: .infinity, height: 52)
                        .padding(.trailing, 16)
                    KlikIDMSkeleton()
                        .frame(width: 138, height: 52)
                }.padding(16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<5) { _ in
                            KlikIDMSkeleton()
                                .frame(width: 300, height: 115)
                        }
                    }
                    .padding(.horizontal, 8)
                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<5) { _ in
                            KlikIDMSkeleton()
                                .frame(width: 92, height: 92)
                        }
                    }
                    .padding(.horizontal, 8)
                }.padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<5) { _ in
                            KlikIDMSkeleton()
                                .frame(width: 120, height: 237)
                        }
                    }
                    .padding(.horizontal, 8)
                }.padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
            }
        }
    }
}

#Preview {
    SkeletonView()
}
