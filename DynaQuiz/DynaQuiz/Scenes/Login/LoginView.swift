//
//  LoginView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                LoginCard()
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .ignoresSafeArea(.all)
        .background(Colors.Background.colored)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
