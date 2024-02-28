//
//  HeaderView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct HeaderView: View {
    @State var counter: Double = 1
    var total: Double = 10

    var body: some View {
        VStack(spacing: Spacing.n3) {
            Text(Question.placeholder.statement)
                .font(.system(size: Sizing.Font.n3))
                .padding(.horizontal)
                .multilineTextAlignment(.center)

            HStack {
                Text("\(Int(counter))/\(Int(total))")
                    .font(.system(size: Sizing.Font.n1))

                Spacer()
            }
            .padding(.horizontal, Spacing.n4)

            ProgressView("", value: counter, total: total)
                .padding(.top, -Spacing.n4)
                .tint(Colors.line)
        }
    }
}

#Preview {
    HeaderView()
}
