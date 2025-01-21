//
//  Extension.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 21/11/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    func font(_ style: KlikIDMFont.FontStyle) -> some View {
        self
            .font(style.font)
            .lineSpacing(style.lineHeight - style.fontSize)
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
    
    func Dialog(
            isPresented: Binding<Bool>,
            title: String,
            description: String,
            primaryButtonText: String,
            primaryAction: @escaping () -> Void,
            secondaryButtonText: String? = nil,
            secondaryAction: (() -> Void)? = nil
        ) -> some View {
            ZStack {
                self

                if isPresented.wrappedValue {
                    KlikIDMDialog(
                        isPresented: isPresented,
                        title: title,
                        description: description,
                        primaryButtonText: primaryButtonText,
                        primaryAction: primaryAction,
                        secondaryButtonText: secondaryButtonText,
                        secondaryAction: secondaryAction
                    )
                }
            }
        }
    
    func ToCGPoint(x pixelX: CGFloat, y pixelY: CGFloat) -> CGPoint {
        let scale = UIScreen.main.scale
        return CGPoint(
                    x: pixelX * scale,
                    y: pixelY * scale
                )
        }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func convexCornerRadius(_ radius: CGFloat, corners: UIRectCorner, curveHeight: CGFloat) -> some View {
        clipShape(CustomTabShape(tabPoint: radius))
    }
}

extension BottomBarView {
    func CustomTabItem(image: String, title: String, isActive: Bool) -> some View {
        HStack(alignment: .center, spacing: 0){
            Spacer()
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? Color.blue50 : Color.grey40)
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(KlikIDMFont.Body.B4.Small)
                    .foregroundColor(isActive ? Color.blue50 : Color.grey40)
            }
            Spacer()
        }
    }
    
    func CustomCenterTabItem(image: String, title: String, isActive: Bool) -> some View {
        HStack(alignment: .center, spacing: 0){
            Spacer()
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.blue50)
                    .frame(width: 25, height: 25)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(Color.blue20)
                    )
                Text(title)
                    .font(KlikIDMFont.Body.B4.Small)
                    .foregroundColor(isActive ? Color.blue50 : Color.grey40)
            }
            Spacer()
        }
    }
}

extension KlikIDMFont.FontStyle: Identifiable, Hashable {
    var id: String {
        "\(font)_\(fontSize)_\(lineHeight)"
    }
    
    static func == (lhs: KlikIDMFont.FontStyle, rhs: KlikIDMFont.FontStyle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                               byRoundingCorners: corners,
                               cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct CustomTabShape: Shape {
    var tabPoint: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let curveHeight: CGFloat = 24  // Adjust this value to control curve depth
        
        // Starting point (top left)
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Draw line to the start of left curve
        path.addLine(to: CGPoint(x: (tabPoint - curveHeight), y: 0))
        
        // Left curve
        path.addQuadCurve(
            to: CGPoint(x: tabPoint, y: curveHeight),
            control: CGPoint(x: tabPoint, y: 0)
        )
        
        // Right curve
        path.addQuadCurve(
            to: CGPoint(x: (tabPoint + curveHeight), y: 0),
            control: CGPoint(x: tabPoint, y: 0)
        )
        
        // Complete the shape
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        
        return path
    }
}
