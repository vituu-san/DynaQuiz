//
//  LoginView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct LoginView: View {
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
    }
}

#Preview {
    LoginView()
}
