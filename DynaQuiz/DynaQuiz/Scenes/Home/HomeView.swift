//
//  HomeView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    var user: User

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HomeCard(user: user)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .ignoresSafeArea(.all)
        .background(Colors.Background.colored)
    }
}
