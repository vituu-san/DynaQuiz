//
//  OptionCell.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

struct OptionCell: View {
    @EnvironmentObject var viewModel: QuestionViewModel
    
    var title: String

    var body: some View {
            Text(title)
                .font(.system(size: Sizing.Font.n1))
                .foregroundStyle(Colors.Text.dark)
                .bold()
                .frame(idealHeight: Sizing.Button.height)
    }
}
