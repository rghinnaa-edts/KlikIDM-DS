//
//  KlikIDMCoachmark.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 11/12/24.
//

import SwiftUI

struct KlikIDMCoachmark: View {
    var varrow: KlikIDMCoachmark.VArrow
    var harrow: KlikIDMCoachmark.HArrow
    
    var body: some View {
        Coachmark()
    }
    
    func Coachmark() -> some View {
        VStack(spacing: 0) {
            if varrow == KlikIDMCoachmark.VArrow.up {
                HStack(spacing:0) {
                    switch harrow {
                    case .left:
                        Path { path in
                            path.move(to: ToCGPoint(x: 14, y: 0))
                            path.addLine(to: ToCGPoint(x: 16, y: 3))
                            path.addLine(to: ToCGPoint(x: 12, y: 3))
                        }
                        .foregroundColor(Color.whiteIDM)
                    case .middle:
                        Path { path in
                            path.move(to: ToCGPoint(x: 66, y: 0))
                            path.addLine(to: ToCGPoint(x: 68, y: 3))
                            path.addLine(to: ToCGPoint(x: 64, y: 3))
                        }
                        .foregroundColor(Color.whiteIDM)
                    case .right:
                        Path { path in
                            path.move(to: ToCGPoint(x: 120, y: 0))
                            path.addLine(to: ToCGPoint(x: 122, y: 3))
                            path.addLine(to: ToCGPoint(x: 118, y: 3))
                        }
                        .foregroundColor(Color.whiteIDM)
                    }
                }
            }
            
            VStack(spacing:0) {
                    HStack(spacing: 0) {
                        Image("placeholder")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color.grey20)
                                    .shadow(radius: 0.5)
                            )
                        
                        VStack(spacing: 0) {
                            Text("Title Goes Here")
                                .font(KlikIDMFont.Heading.H1)
                                .foregroundColor(Color.grey70)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("The quick brown fox jumps over the lazy dog")
                                .font(KlikIDMFont.Paragraph.P2.Small)
                                .foregroundColor(Color.grey60)
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 16)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .foregroundColor(Color.grey30)
                        .padding(.top, 16)
                    
                    HStack(spacing: 0) {
                        Text("1 dari 5")
                            .font(KlikIDMFont.Body.B4.Heavy)
                            .foregroundColor(Color.greyText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        KlikIDMButton(text: "Button",
                                      style: KlikIDMButton.Style.Tertiary,
                                      size: KlikIDMButton.Size.Small,
                                      iconType: KlikIDMButton.IconType.NoIcon,
                                      isDisabled: false,
                                      action: {}).padding(.leading, 8)
                        KlikIDMButton(text: "Button",
                                      style: KlikIDMButton.Style.Primary,
                                      size: KlikIDMButton.Size.Small,
                                      iconType: KlikIDMButton.IconType.NoIcon,
                                      isDisabled: false,
                                      action: {}).padding(.leading, 8)
                    }
                    .padding(.top, 16)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.whiteIDM)
                )
                .padding(EdgeInsets(top: -1, leading: 16, bottom: 0, trailing: 16))
            
            if varrow == KlikIDMCoachmark.VArrow.down {
                HStack(spacing:0) {
                    switch harrow {
                    case .left:
                        Path { path in
                            path.move(to: ToCGPoint(x: 14, y: 3))
                            path.addLine(to: ToCGPoint(x: 16, y: 0))
                            path.addLine(to: ToCGPoint(x: 12, y: 0))
                        }
                        .foregroundColor(Color.whiteIDM)
                    case .middle:
                        Path { path in
                            path.move(to: ToCGPoint(x: 66, y: 3))
                            path.addLine(to: ToCGPoint(x: 68, y: 0))
                            path.addLine(to: ToCGPoint(x: 64, y: 0))
                        }
                        .foregroundColor(Color.whiteIDM)
                    case .right:
                        Path { path in
                            path.move(to: ToCGPoint(x: 120, y: 3))
                            path.addLine(to: ToCGPoint(x: 122, y: 0))
                            path.addLine(to: ToCGPoint(x: 118, y: 0))
                        }
                        .foregroundColor(Color.whiteIDM)
                    }
                }
            }
        }
    }
    
    enum VArrow {
        case up
        case down
    }
    
    enum HArrow {
        case left
        case middle
        case right
    }
}
