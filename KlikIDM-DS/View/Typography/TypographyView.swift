//
//  Typography.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 18/11/24.
//

import SwiftUI

struct TypographyView: View {
    
    var fontStyle: [(String, KlikIDMFont.FontStyle)] = [
        ("Display.D1", KlikIDMFont.Display.D1),
        ("Display.D2", KlikIDMFont.Display.D2),
        ("Heading.H1", KlikIDMFont.Heading.H1),
        ("Heading.H2", KlikIDMFont.Heading.H2),
        ("Heading.H3", KlikIDMFont.Heading.H3),
        ("Body.B1.Large", KlikIDMFont.Body.B1.Large),
        ("Body.B1.Small", KlikIDMFont.Body.B1.Small),
        ("Body.B2.Heavy", KlikIDMFont.Body.B2.Heavy),
        ("Body.B2.Large", KlikIDMFont.Body.B2.Large),
        ("Body.B2.Medium", KlikIDMFont.Body.B2.Medium),
        ("Body.B2.Small", KlikIDMFont.Body.B2.Small),
        ("Body.B3.Large", KlikIDMFont.Body.B3.Large),
        ("Body.B3.Medium", KlikIDMFont.Body.B3.Medium),
        ("Body.B3.Small", KlikIDMFont.Body.B3.Small),
        ("Body.B4.Heavy", KlikIDMFont.Body.B4.Heavy),
        ("Body.B4.Large", KlikIDMFont.Body.B4.Large),
        ("Body.B4.Small", KlikIDMFont.Body.B4.Small),
        ("Paragraph.P1.Large", KlikIDMFont.Paragraph.P1.Large),
        ("Paragraph.P1.Small", KlikIDMFont.Paragraph.P1.Small),
        ("Paragraph.P2.Large", KlikIDMFont.Paragraph.P2.Large),
        ("Paragraph.P2.Small", KlikIDMFont.Paragraph.P2.Small),
        ("Button.Big", KlikIDMFont.Button.Big),
        ("Button.Medium", KlikIDMFont.Button.Medium),
        ("Button.Small", KlikIDMFont.Button.Small)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(fontStyle, id: \.0) { name, style in
                        VStack(alignment: .leading) {
                            Text("KlikIDMFont.\(name)").font(style)
                        }.padding().frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.navigationTitle("Typography")
        }
    }
}

#Preview {
    TypographyView()
}
