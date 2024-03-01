//
//  OutcomeView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 29/02/24.
//

import SwiftUI

struct OutcomeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: OutcomeViewModel
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            ZStack {
                CircleProgress(progress: Float(viewModel.user.score) / 10)
                    .padding(Spacing.n5)

                Text("\(viewModel.user.score)/10")
                    .font(.system(size: Sizing.Font.n4))
            }
            .padding(.top, Spacing.n8)
            .padding(.bottom, Spacing.n5)

            VStack(spacing: Spacing.n3) {
                Text("Parabéns \(viewModel.user.name)!")
                    .font(.system(size: Sizing.Font.n4))
                    .bold()

                Text("Continue praticando. Se quiser, você pode reiniciar.")
                    .font(.system(size: Sizing.Font.n2))
            }

            Spacer()

            CustomButton(text: "Reiniciar") {
                viewModel.tapRestartButton()
                dismiss()
            }
            .padding(.bottom, Spacing.n6)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, Spacing.n3)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: OutcomeNavBarButton {
            coordinator.go(to: .home(user: viewModel.user))
        })
        .ignoresSafeArea(.all)
    }
}

import RealmSwift

#Preview {
    OutcomeView()
        .environmentObject(
            OutcomeViewModel(user: User(name: "John", score: 7),
                             databaseManager: Database(realm: try! Realm()))
        )
}
