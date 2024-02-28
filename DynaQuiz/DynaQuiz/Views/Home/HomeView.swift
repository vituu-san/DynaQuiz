//
//  HomeView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HomeCard()
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .ignoresSafeArea(.all)
        .background(Colors.Background.colored)
    }
}

#Preview {
    HomeView()
}
