//
//  LoginCard.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct LoginCard: View {
    @State private var username: String = ""
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        ZStack {
            VStack(spacing: Spacing.n2) {
                Image("quiz2")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)

                TextField("Digite seu nome", text: $username)
                    .frame(height: Sizing.Text.height)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                            .stroke(Colors.border)
                    )
                    .padding(.horizontal, Spacing.n1)
                    .padding(.bottom, Spacing.n2)

                VStack(spacing: Spacing.n1) {
                    NormalButton(title: "Continuar", disabled: true) {
                        coordinator.push(page: .home)
                        print("Olá, \(username)")
                    }
                    .bold()
                }
            }
            .padding([.top, .horizontal], Spacing.n3)
            .padding(.bottom, 60)
        }
        .background(Colors.Background.normal)
        .clipShape(RoundedRectangle(cornerRadius: Sizing.cornerRadius))
    }
}

#Preview {
    LoginCard()
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, Spacing.n3)
            .background(
                RoundedRectangle(cornerRadius: Sizing.cornerRadius, style: .continuous)
                    .stroke(Colors.border, lineWidth: 1)
            )
    }
}
