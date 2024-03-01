//
//  LoginCard.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI
import RealmSwift

struct LoginCard: View {
    @State private var username: String = ""

    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        ZStack {
            VStack(spacing: Spacing.n2) {
                Image("quiz2")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)

                CustomTextField(username: $username)
                .frame(height: Sizing.Text.height)
                .padding(.horizontal, Spacing.n1)
                .padding(.bottom, Spacing.n2)

                CustomButton(text: "Continuar") {
                    viewModel.register(username)
                    coordinator.push(page: .home(user: viewModel.user))
                }
                .disabled(username.isEmpty)

            }
            .padding([.top, .horizontal], Spacing.n3)
            .padding(.bottom, 60)
        }
        .background(Colors.Background.normal)
        .clipShape(RoundedRectangle(cornerRadius: Sizing.cornerRadius))
        .environmentObject(viewModel)
    }
}

#Preview {
    LoginCard()
        .environmentObject(LoginViewModel(databaseManager: Database(realm: try! Realm())))
}
