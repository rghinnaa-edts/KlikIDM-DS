//
//  CoachmarkView.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 11/12/24.
//

import SwiftUI

struct CoachmarkView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.up,
                        harrow: KlikIDMCoachmark.HArrow.left
                    )
                    
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.up,
                        harrow: KlikIDMCoachmark.HArrow.middle
                    )
                    
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.up,
                        harrow: KlikIDMCoachmark.HArrow.right
                    )
                    
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.down,
                        harrow: KlikIDMCoachmark.HArrow.left
                    )
                    
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.down,
                        harrow: KlikIDMCoachmark.HArrow.middle
                    )
                    
                    KlikIDMCoachmark(
                        varrow: KlikIDMCoachmark.VArrow.down,
                        harrow: KlikIDMCoachmark.HArrow.right
                    )
                }
            }.navigationTitle("Coachmark")
                .background(Color.black.opacity(0.5))
        }
    }
}

#Preview {
    CoachmarkView()
}
