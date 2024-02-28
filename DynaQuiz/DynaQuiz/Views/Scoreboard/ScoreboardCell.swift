//
//  ScoreboardCell.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct ScoreboardCell: View {
    var position: String
    var name: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                .fill(Colors.Button.Option.background)
                .stroke(Colors.border, lineWidth: 1)

            HStack(spacing: Spacing.n5) {
                ZStack {
                    Circle()
                        .fill(Colors.border)
                        .stroke(Colors.border, lineWidth: 1)
                        .frame(width: 40, height: 40)
                    Text(position)
                }
                .padding(.leading, Spacing.n5)

                Text(name)

                Spacer()
            }
            .frame(height: Sizing.Text.height)
            .frame(maxWidth: .infinity)
            .font(.system(size: Sizing.Font.n2))
            .foregroundStyle(Colors.Text.dark)
            .bold()
        }
    }
}

#Preview {
    ScoreboardCell(position: "1", name: "John")
}
