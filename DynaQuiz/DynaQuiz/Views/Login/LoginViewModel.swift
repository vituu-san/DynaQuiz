//
//  LoginViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 28/02/24.
//

import SwiftUI

protocol LoginViewModeling {
    var user: User { get }

    func onAppear()
    func register(_ username: String)
}

final class LoginViewModel: LoginViewModeling, ObservableObject {
    private var databaseManager: DatabaseProtocol

    @Published var user: User = User.placeholder

    init(databaseManager: DatabaseProtocol) {
        self.databaseManager = databaseManager
    }

    func onAppear() {
        initializeDatabase()
    }

    func register(_ username: String) {
        user = User(name: username, score: 0)
        do {
            try databaseManager.create(user)
        } catch let error {
            print(error)
        }
    }

    private func initializeDatabase() {
        if try! databaseManager.all(of: User.self).isEmpty {
            register(User.placeholder.name)
        }
    }
}
