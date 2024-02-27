//
//  CustomButton.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var color: Color
    var textColor: Color
    var width: Double
    var height: Double

    var onTapGesture: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .stroke(.gray.opacity(0.8), lineWidth: 2)
                .padding(.vertical, 4)
                .frame(width: width, height: height)
                .onTapGesture {
                    onTapGesture()
                }

            Text(title)
                .font(.system(size: 22))
                .foregroundStyle(textColor)
        }
    }
}
