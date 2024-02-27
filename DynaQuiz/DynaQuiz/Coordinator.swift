//
//  Coordinator.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI
import RealmSwift

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    enum Page: Hashable {
        case content
    }

    func push(page: Page) {
        path.append(page)
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .content:
            let service = Service(session: URLSession.shared)
            let realm = try! Realm()
            let viewModel = ViewModel(databaseManager: Database(realm: realm), service: service)
            QuestionView(viewModel: viewModel)
        }
    }
}
