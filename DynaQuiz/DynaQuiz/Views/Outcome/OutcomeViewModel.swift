//
//  OutcomeViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 01/03/24.
//

import Foundation

protocol OutcomeViewModeling {
    func tapRestartButton()
}

final class OutcomeViewModel: OutcomeViewModeling, ObservableObject {
    private(set) var user: User
    private var databaseManager: DatabaseProtocol

    init(user: User, databaseManager: DatabaseProtocol) {
        self.user = user
        self.databaseManager = databaseManager
    }

    func tapRestartButton() {
        try! databaseManager.update(of: user, type: User.self, key: "score", value: 0)
    }
}
