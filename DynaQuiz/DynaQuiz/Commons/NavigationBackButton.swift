//
//  NavigationBackButton.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct NavigationBackButton: View {
    let dismiss: DismissAction

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("left-arrow")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}
