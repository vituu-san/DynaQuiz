//
//  DynaQuizApp.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import SwiftUI

@main
struct DynaQuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel.shared)
        }
    }
}
