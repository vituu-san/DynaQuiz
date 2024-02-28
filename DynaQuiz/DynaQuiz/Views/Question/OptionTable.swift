//
//  OptionTable.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct OptionTable: View {
    var tappedOnCell: ((_ option: String) -> Void)?

    @State private var items = Question.placeholder.options
    @State private var selectedRow: String?

    var body: some View {
        List {
            ForEach(items, id: \.self) { option in
                Text(option)
                    .frame(height: Sizing.Text.height)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: Sizing.Font.n2))
                    .foregroundStyle(
                        option == selectedRow ? Colors.Text.light : Colors.Text.dark
                    )
                    .bold()
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                            .fill(
                                option == selectedRow ? Colors.Button.Option.selected : Colors.Button.Option.background)
                            .stroke(Colors.border, lineWidth: 1)
                            .padding(.vertical, Spacing.n1)
                    )
                    .onTapGesture {
                        self.selectedRow = option
                        tappedOnCell?(option)
                    }
            }
        }
        .scrollContentBackground(.hidden)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    OptionTable()
}
