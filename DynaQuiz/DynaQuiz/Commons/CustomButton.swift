//
//  CustomButton.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.system(size: Sizing.Font.n1))
                .bold()
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(Colors.Button.Normal.background)
    }
}
