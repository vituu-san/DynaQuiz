//
//  ScoreboardView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct ScoreboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var items = Question.placeholder.options
    @State private var selectedRow: String?

    var body: some View {
        List {
            ForEach(Array(items.enumerated()), id: \.offset) { index, user in
                ScoreboardCell(position: "\(index + 1)", name: user)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: Spacing.n2,
                                         leading: Spacing.n2,
                                         bottom: Spacing.n2,
                                         trailing: Spacing.n2))
            }
        }
        .padding(.horizontal, -Spacing.n3)
        .padding(.top, -Spacing.n5)
        .scrollContentBackground(.hidden)
        .scrollBounceBehavior(.basedOnSize)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavigationBackButton(dismiss: dismiss))
    }
}

#Preview {
    ScoreboardView()
}
