//
//  Coordinator.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import SwiftUI
import RealmSwift

final class Coordinator: ObservableObject {
    @Published var path = [Page]()

    enum Page: Hashable, Equatable {
        case login
        case home(user: User)
        case content(user: User)
        case scoreboard
        case outcome(user: User)
        case error(message: String)
    }

    func push(page: Page) {
        if let page = path.first(where: { $0 == page }) {
            go(to: page)
        }

        path.append(page)
    }

    func go(to page: Page) {
        path = [page]
    }

    func pop() {
        path.removeLast()
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            let realm = try! Realm()
            let databaseManager = Database(realm: realm)
            let viewModel = LoginViewModel(databaseManager: databaseManager)
            LoginView()
                .environmentObject(viewModel)

        case .home(let user):
            HomeView(user: user)

        case .content(let user):
            let service = Service(session: URLSession.shared)
            let realm = try! Realm()
            let viewModel = QuestionViewModel(databaseManager: Database(realm: realm), service: service, user: user)
            QuestionView()
                .environmentObject(viewModel)

        case .scoreboard:
            let realm = try! Realm()
            let databaseManager = Database(realm: realm)
            let viewModel = ScoreboardViewModel(databaseManager: databaseManager)
            ScoreboardView()
                .environmentObject(viewModel)

        case .outcome(let user):
            let realm = try! Realm()
            OutcomeView()
                .environmentObject(OutcomeViewModel(user: user, databaseManager: Database(realm: realm)))

        case .error(let message):
            GenericError(message: message)
        }
    }
}
