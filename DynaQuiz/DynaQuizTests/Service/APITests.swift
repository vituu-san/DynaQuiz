//
//  APITests.swift
//  DynaQuizTests
//
//  Created by Vitor Costa on 27/02/24.
//

import XCTest

@testable import DynaQuiz

final class APITests: XCTestCase {
    func testPaths_WhenQuestion() {
        XCTAssertEqual(DynamoxAPI.getQuestion.url.description, "https://quiz-api-bwi5hjqyaq-uc.a.run.app/question")
    }

    func testPaths_WhenAnswer() {
        XCTAssertEqual(DynamoxAPI.postAnswer(id: "10").url.absoluteString,
                       "https://quiz-api-bwi5hjqyaq-uc.a.run.app/answer?questionId=10")
    }
}
