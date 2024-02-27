//
//  QuestionView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import SwiftUI

struct QuestionView: View {
    var viewModel: ViewModel

    var body: some View {
        VStack {
            Spacer(minLength: 30)
            Text(Question.placeholder.statement)
                .font(.system(size: 32))
                .padding(.horizontal)
                .multilineTextAlignment(.center)

            OptionTable()

            HStack {
                CustomButton(title: "Responder", 
                             color: .orange,
                             textColor: .white,
                             width: 170,
                             height: 60) {
                    print("Clicou em responder!")
                }

                CustomButton(title: "Próxima", 
                             color: .gray,
                             textColor: .white,
                             width: 170,
                             height: 60) {
                    print("Clicou em responder!")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    QuestionView(viewModel: .shared)
}
