//
//  ContentView.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel: ViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
