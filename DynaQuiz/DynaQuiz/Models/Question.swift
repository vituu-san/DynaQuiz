//
//  Question.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

struct Question: Codable, Equatable {
    var questionId: String
    var statement: String
    var options: [String]

    enum CodingKeys: String, CodingKey {
        case questionId = "id"
        case statement
        case options
    }

    static var placeholder: Question {
        Question(questionId: "1", 
                 statement: "Qual é o nome da empresa mais legal do mundo?",
                 options: ["Google", "Microsoft", "Dynamox", "Spotify", "Amazon"])
    }
}

extension Question: Identifiable {
    var id: UUID { return UUID() }
}
