//
//  HomeCard.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct HomeCard: View {
    @State private var username: String = ""
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        ZStack {
            VStack(spacing: Spacing.n2) {
                Image("quiz2")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 30)

                VStack(spacing: Spacing.n1) {
                    NormalButton(title: "Placar") {
                        coordinator.push(page: .scoreboard)
                        print("Olá, \(username)")
                    }
                    .bold()

                    NormalButton(title: "Iniciar") {
                        coordinator.push(page: .content)
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
    HomeCard()
}
