//
//  XCTestCase.swift
//  DynaQuizTests
//
//  Created by Vitor Costa on 27/02/24.
//

import XCTest

extension XCTestCase {
    func wait(for time: Double) {
        let expectation = XCTestExpectation(description: "Waiting deadline...")

        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            expectation.fulfill()
        }
    }
}
