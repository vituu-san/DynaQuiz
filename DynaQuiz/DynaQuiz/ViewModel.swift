//
//  ViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

protocol ViewModeling {
    var question: Question { get }
    var response: Answer { get }

    func register(user: User)
    func scoreboard() -> [User]
    func chose(option: String)
    func next()
}

final class ViewModel: ViewModeling {
    private let service: Servicing
    private let databaseManager: DatabaseProtocol

    @Published var question: Question = .placeholder
    @Published var response: Answer = .placeholder

    init(databaseManager: DatabaseProtocol, service: Servicing) {
        self.databaseManager = databaseManager
        self.service = service
        fetchQuestion()
        initializeDatabase()
    }

    func initializeDatabase() {
        if scoreboard().isEmpty {
            register(user: .placeholder)
        }
    }

    // MARK: - ViewModeling
    func register(user: User) {
        do {
            try databaseManager.create(user)
        } catch let error {
            print(error)
        }
    }

    func scoreboard() -> [User] {
        do {
            let users = try databaseManager.all(of: User.self)
            
            return Array(users)
        } catch let error {
            print(error)
        }
        return []
    }

    func chose(option: String) {
        postAnswer(answer: option)
    }

    func next() {
        fetchQuestion()
    }

    // MARK: - Service
    private func fetchQuestion() {
        service.fetchQuestion { [weak self] result in
            switch result {
            case .success(let question):
                self?.question = question
            case .failure(let error):
                print(error)
            }
        }
    }

    private func postAnswer(answer: String) {
        service.postAnswer(id: question.id, answer: answer) { [weak self] result in
            switch result {
            case .success(let response):
                self?.response = response
            case .failure(let error):
                print(error)
            }
        }
    }
}

// Solução temporária para injeção de dependência na `ContentView`
import RealmSwift

extension ViewModel {
    static var shared: ViewModel {
        let service = Service(session: URLSession.shared)
        let realm = try! Realm()
        return ViewModel(databaseManager: Database(realm: realm), service: service)
    }
}
