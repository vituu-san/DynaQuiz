//
//  ScoreboardView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct ScoreboardView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: ScoreboardViewModel

    var body: some View {
        List {
            ForEach(Array($viewModel.users.enumerated()), id: \.offset) { index, user in
                ScoreboardCell(position: "\(index + 1)", name: user.wrappedValue.name, points: user.score.wrappedValue)
                    .listRowSeparator(.hidden)
            }
        }
        .padding(.horizontal, -Spacing.n4)
        .padding(.top, -Spacing.n2)
        .scrollContentBackground(.hidden)
        .scrollBounceBehavior(.basedOnSize)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavigationBackButton(dismiss: dismiss))
        .onAppear {
            viewModel.onAppear()
        }
    }
}
