//
//  HeaderView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: QuestionViewModel

    var body: some View {
        VStack(spacing: Spacing.n3) {
            Text(viewModel.question.statement)
                .font(.system(size: Sizing.Font.n2))
                .bold()
                .padding(.horizontal)
                .multilineTextAlignment(.center)

            HStack {
                Text("\(Int(viewModel.counter))/\(Int(10))")
                    .font(.system(size: Sizing.Font.n1))

                Spacer()
            }
            .padding(.horizontal, Spacing.n4)

            ProgressView("", value: Double(viewModel.counter), total: 10)
                .padding(.top, -Spacing.n4)
                .tint(Colors.line)
        }
    }
}
