//
//  QuestionViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation
import SwiftUI

protocol QuestionViewModeling {
    var question: Question { get }
    var answer: Answer { get }
    var cellColor: Color { get }
    var selectedOption: String { get }
    var counter: Int { get }
    var answered: Bool { get }

    func onAppear()
    func chose(option: String)
    func tapAnswerButton()
    func tapNextButton()
}

enum ButtonState {
    case normal
    case selected
    case wrong
    case correct
}

final class QuestionViewModel: QuestionViewModeling, ObservableObject {
    private let service: Servicing
    private let databaseManager: DatabaseProtocol

    private(set) var user: User

    @Published var question: Question = .placeholder
    @Published var answer: Answer = .placeholder
    @Published var cellColor: Color = Colors.Button.Option.background
    @Published var selectedOption: String = ""
    @Published var counter: Int = 1
    @Published var answered: Bool = false
    @Published var finished: Bool = false
    @Published var errorMessage: String?

    init(databaseManager: DatabaseProtocol, service: Servicing, user: User) {
        self.databaseManager = databaseManager
        self.service = service
        self.user = user
    }

    // MARK: - ViewModeling
    func onAppear() {
        fetchQuestion()
    }

    func chose(option: String) {
        selectedOption = option
        setCellColor(to: .selected)
    }

    func tapAnswerButton() {
        postAnswer()
        answered.toggle()

        if counter == 10 {
            finished.toggle()
        }
    }

    func tapNextButton() {
        if !finished {
            fetchQuestion()
            counter += 1
            answered.toggle()
        }
    }

    // MARK: - Helpers
    private func handleAnswer(_ answer: Answer) {
        self.answer = answer
        setCellColor(to: answer.result ? .correct : .wrong)
        
        if answer.result {
            increaseScore()
        }
    }

    private func increaseScore() {
        try! databaseManager.update(of: user, type: User.self, key: "score", value: user.score + 1)
        self.user = try! databaseManager.getObject(by: user._id, type: User.self) ?? .placeholder
    }

    private func setCellColor(to state: ButtonState) {
        switch state {
        case .normal:
            self.cellColor = Colors.Button.Option.background
        case .selected:
            self.cellColor = Colors.Button.Option.selected
        case .correct:
            self.cellColor = Colors.Button.Option.correct
        case .wrong:
            self.cellColor = Colors.Button.Option.wrong
        }
    }

    // MARK: - Service
    private func fetchQuestion() {
        service.fetchQuestion { [weak self] result in
            switch result {
            case .success(let question):
                self?.question = question
            case .failure(let error):
                self?.errorMessage = error.rawValue
            }
        }
    }

    private func postAnswer() {
        service.postAnswer(id: question.questionId, answer: selectedOption) { [weak self] result in
            switch result {
            case .success(let answer):
                self?.handleAnswer(answer)
            case .failure(let error):
                self?.errorMessage = error.rawValue
            }
        }
    }
}
