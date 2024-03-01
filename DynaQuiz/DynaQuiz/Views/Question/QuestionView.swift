//
//  QuestionView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: QuestionViewModel
    @EnvironmentObject var coordinator: Coordinator

    @State private var question: Question?

    var body: some View {
        VStack {
            HeaderView()

            OptionTable()

            VStack {
                CustomButton(text: "Responder") {
                    viewModel.tapAnswerButton()
                }
                .disabled(viewModel.selectedOption.isEmpty || viewModel.answered)

                CustomButton(text: viewModel.finished ? "Finalizar" : "Próxima") {
                    if !viewModel.finished {
                        viewModel.tapNextButton()
                    } else {
                        coordinator.push(page: .outcome(user: viewModel.user))
                    }
                }
                .disabled(!viewModel.answered)
            }
            .padding(.horizontal, Spacing.n3)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavigationBackButton(dismiss: dismiss))
        .onReceive(viewModel.$errorMessage, perform: { message in
            guard let message else { return }
            coordinator.push(page: .error(message: message))
        })
        .onAppear {
            viewModel.onAppear()
        }
        .environmentObject(viewModel)
    }
}
