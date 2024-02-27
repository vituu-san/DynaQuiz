//
//  OptionTable.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct OptionTable: View {

    @State private var items = Question.placeholder.options
    @State private var selectedRow: String?

    var body: some View {
        List {
            ForEach(items, id: \.self) { option in
                Text(option)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 22))
                    .foregroundStyle(option == selectedRow ? Color.white : Color.black)
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(option == selectedRow ? Color.yellow : Color.white)
                            .stroke(.gray.opacity(0.8), lineWidth: 2)
                            .padding(.vertical, 4)
                    )
                    .onTapGesture {
                        self.selectedRow = option
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
