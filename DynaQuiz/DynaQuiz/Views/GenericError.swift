//
//  GenericError.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import SwiftUI

struct GenericError: View {
    var message: String

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: Spacing.n6) {
            Spacer()
            Image("error")
                .resizable()
                .frame(width: 150, height: 150)

            VStack(spacing: Spacing.n2) {
                Text("Ops!")
                    .font(.system(size: Sizing.Font.n4))
                    .bold()
                Text("Algo quebrou aqui!")
                    .font(.system(size: Sizing.Font.n2))
                    .bold()
            }
            
            Spacer()
            CustomButton(text: "Voltar") {
                dismiss()
            }
            .padding(.bottom, Spacing.n6)
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, Spacing.n3)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    GenericError(message: "Algo quebrou aqui!")
}
