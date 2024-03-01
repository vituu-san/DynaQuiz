//
//  OptionTable.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct OptionTable: View {
    @EnvironmentObject var viewModel: QuestionViewModel

    var body: some View {
        List {
            ForEach(viewModel.question.options, id: \.self) { option in
                OptionCell(title: option)
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                            .fill(
                                viewModel.selectedOption == option ? viewModel.cellColor : Colors.Button.Option.background
                            )
                            .stroke(Colors.border, lineWidth: 1)
                            .padding(.vertical, Spacing.n1)
                    )
                    .onTapGesture {
                        viewModel.chose(option: option)
                    }
                    .disabled(viewModel.answered)
            }
        }
        .padding(.horizontal, -Spacing.n2)
        .scrollContentBackground(.hidden)
        .scrollBounceBehavior(.basedOnSize)
        .onAppear {
           UICollectionView.appearance().contentInset.top = -30
        }
    }
}
