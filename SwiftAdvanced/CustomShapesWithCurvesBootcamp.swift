//
//  CustomShapesWithCurvesBootcamp.swift
//  SwiftAdvanced
//
//  Created by Toni Stoyanov on 8.02.25.
//

import SwiftUI

struct CustomShapesWithCurvesBootcamp: View {
    var body: some View {
        WaterShape()
//            .fill(
//                LinearGradient(colors: [Color.blue, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing)
//            )
//            .frame(width: 200, height: 200)
            .ignoresSafeArea()
    }
}

#Preview {
    CustomShapesWithCurvesBootcamp()
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true
            )
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
                // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            //mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            //bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            //mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}


struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.maxX - 50, y: rect.minY - 10)
            )
        }
    }
}


struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60)
            )
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
