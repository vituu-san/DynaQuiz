//
//  CircleProgress.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import SwiftUI

struct CircleProgress: View {
    var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .foregroundStyle(Colors.border.opacity(0.4))

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundStyle(Colors.line)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.5), value: true)
        }
    }
}

struct CircleProgressView: View {
    var progress: Float = 0.3

    var body: some View {
        CircleProgress(progress: progress)
            .padding()
    }
}

#Preview {
    CircleProgressView(progress: 1)
}
