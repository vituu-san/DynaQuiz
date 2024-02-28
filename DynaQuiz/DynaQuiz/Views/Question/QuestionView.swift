//
//  QuestionView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) private var dismiss

    var viewModel: ViewModel

    var body: some View {
        VStack {
            HeaderView(counter: 1, total: 10)

            OptionTable()
                .padding(.top, -Spacing.n4)
                .padding(.bottom, Spacing.n3)

            NormalButton(title: "Responder") {
                print("Clicou em responder!")
            }
            .padding(.horizontal)

            NormalButton(title: "Próxima", disabled: true) {
                print("Clicou em próxima!")
            }
            .padding(.horizontal)
            .padding(.top, -Spacing.n3)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavigationBackButton(dismiss: dismiss))
    }
}

#Preview {
    QuestionView(viewModel: .shared)
}
