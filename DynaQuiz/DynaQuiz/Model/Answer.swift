//
//  Answer.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

struct Answer: Codable, Equatable {
    var result: Bool

    static var placeholder: Answer {
        Answer(result: false)
    }
}
