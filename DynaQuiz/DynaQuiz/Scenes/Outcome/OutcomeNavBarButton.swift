//
//  OutcomeNavBarButton.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import SwiftUI

struct OutcomeNavBarButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image("left-arrow")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}
