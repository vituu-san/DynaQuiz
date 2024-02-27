//
//  API.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

protocol API {
    static var baseURL: URL { get }
}

enum DynamoxAPI: RawRepresentable, API {

    static var baseURL: URL = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/")!

    var rawValue: String {
        switch self {
        case .getQuestion: return "question"
        case .postAnswer(let id): return "answer?questionId=\(id)"
        }
    }

    case getQuestion
    case postAnswer(id: String)
}
