//
//  CustomTextField.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var username: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                .stroke(Colors.border)
            TextField("Digite seu nome", text: $username)
                .autocorrectionDisabled(true)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, Spacing.n3)

        }
    }
}
