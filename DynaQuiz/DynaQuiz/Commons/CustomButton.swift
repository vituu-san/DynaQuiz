//
//  CustomButton.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct NormalButton: View {
    var title: String
    @State var disabled: Bool = false
    var onTapGesture: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                .fill(
                    disabled ? Colors.Button.Normal.disabled : Colors.Button.Normal.background
                )
                .padding(.vertical, Spacing.n1)
                .frame(height: Sizing.Button.height)
                .onTapGesture {
                    if !disabled {
                        onTapGesture()
                    }
                }

            Text(title)
                .font(.system(size: Sizing.Font.n1))
                .foregroundStyle(Colors.Text.light)
                .bold()
        }
    }
}


struct OptionButton: View {
    var title: String
    var onTapGesture: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Sizing.cornerRadius)
                .fill(Colors.Button.Option.background)
                .stroke(Colors.border, lineWidth: 1)
                .padding(.vertical, Spacing.n1)
                .frame(height: Sizing.Button.height)
                .onTapGesture {
                    onTapGesture()
                }

            Text(title)
                .font(.system(size: Sizing.Font.n1))
                .foregroundStyle(Colors.Text.light)
                .bold()
        }
    }
}
