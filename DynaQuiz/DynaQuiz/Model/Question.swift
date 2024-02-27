//
//  Question.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

struct Question: Codable, Equatable {
    var id: String
    var statement: String
    var options: [String]

    static var placeholder: Question {
        Question(id: "", statement: "", options: [])
    }
}
