//
//  KlikIDMProgressBar.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 10/01/25.
//

import SwiftUI

struct KlikIDMProgressBar: View {
    var progressColor: Color = Color.blue50
    var innerArcPadding: CGFloat = 7
    var progressThickness: CGFloat = 3
    var progressSize: CGFloat = 50
    var rotateSpeed: Double = 5
    var arcSweepAngle: Double = 270
    
    @State private var outerRotation = 0.0
    @State private var innerRotation = 180.0
    
    var body: some View {
        DoubleArc()
    }
    
    func DoubleArc() -> some View {
        let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()
        
        return ZStack {
            ArcShape(startAngle: .degrees(outerRotation),
                     endAngle: .degrees(outerRotation + arcSweepAngle))
            .stroke(progressColor, style: StrokeStyle(
                    lineWidth: progressThickness,
                    lineCap: .round
                ))
                .frame(width: progressSize - 2 * innerArcPadding,
                       height: progressSize - 2 * innerArcPadding)
            
            ArcShape(startAngle: .degrees(innerRotation),
                    endAngle: .degrees(innerRotation + arcSweepAngle))
                .stroke(progressColor, style: StrokeStyle(
                    lineWidth: progressThickness,
                    lineCap: .round
                ))
                .frame(width: progressSize - 4 * innerArcPadding,
                       height: progressSize - 4 * innerArcPadding)
        }
        .frame(width: progressSize, height: progressSize)
        .onReceive(timer) { _ in
            outerRotation = (outerRotation + rotateSpeed).truncatingRemainder(dividingBy: 360)
            innerRotation = (innerRotation - rotateSpeed).truncatingRemainder(dividingBy: 360)
        }
    }
    
    struct ArcShape: Shape {
        let startAngle: Angle
        let endAngle: Angle
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                       radius: rect.width / 2,
                       startAngle: startAngle,
                       endAngle: endAngle,
                       clockwise: false)
            return path
        }
    }
}
