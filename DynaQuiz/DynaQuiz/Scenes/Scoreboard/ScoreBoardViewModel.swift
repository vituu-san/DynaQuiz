//
//  ScoreBoardViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import Foundation

protocol ScoreboardViewModeling {
    var databaseManager: DatabaseProtocol { get }
    func onAppear()
}

final class ScoreboardViewModel: ObservableObject, ScoreboardViewModeling {
    var databaseManager: DatabaseProtocol

    @Published var users: [User] = []

    init(databaseManager: DatabaseProtocol) {
        self.databaseManager = databaseManager
    }

    func onAppear() {
        let items = Array(try! databaseManager.all(of: User.self).filter { !$0.name.isEmpty })
        users = items.sorted(by: { $0.score > $1.score })
    }
}
