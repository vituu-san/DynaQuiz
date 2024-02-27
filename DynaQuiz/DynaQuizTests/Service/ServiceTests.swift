//
//  ServiceTests.swift
//  DynaQuizTests
//
//  Created by Vitor Costa on 26/02/24.
//

import XCTest

@testable import DynaQuiz

final class ServiceTests: XCTestCase {
    var sut: Service!
    var sessionMock: URLSessionMock!

    override func setUp() {
        sessionMock = URLSessionMock()
        sut = Service(session: sessionMock)
    }

    override func tearDown() {
        sut = nil
        sessionMock = nil
    }

    func testFetchQuestion_WithError_ShouldReturnCustomError() throws {
        let expectedError = APIError.custom(NSError(domain: "", code: 0))
        sessionMock.error = expectedError
        
        sut.fetchQuestion { result in
            switch result {
            case .success(_):
                XCTFail("Unexpected behavior!")
            case .failure(let error):
                XCTAssertEqual(expectedError, error)
            }
        }
    }

    func testFetchQuestion_WithWrongData_ShouldReturnError() throws {
        let data = """
                    'id': '2'
                   """.data(using: .utf8)

        sessionMock.data = data
        let expectedError = APIError.wrongData

        sut.fetchQuestion { result in
            switch result {
            case .success(_):
                XCTFail("Unexpected behavior!")
            case .failure(let error):
                XCTAssertEqual(expectedError, error)
            }
        }
    }

    func testFetchQuestion_WithNoData_ShouldReturnError() throws {
        let expectedError = APIError.noData

        sut.fetchQuestion { result in
            switch result {
            case .success(_):
                XCTFail("Unexpected behavior!")
            case .failure(let error):
                XCTAssertEqual(expectedError, error)
            }
        }
    }

    func testFetchQuestion_WithData_ShouldReturnQuestion() throws {
        guard let data = try? JSONEncoder().encode(Question.placeholder) else {
            XCTFail("Couldn't encode data!")
            return
        }

        guard let expectedData = try? JSONDecoder().decode(Question.self, from: data) else {
            XCTFail("Couldn't decode data!")
            return
        }

        sessionMock.data = data

        sut.fetchQuestion { result in
            switch result {
            case .success(let question):
                XCTAssertEqual(expectedData, question)
            case .failure(_):
                XCTFail("Unexpected behavior!")
            }
        }
    }
}

extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.server, .server), (.wrongData, .wrongData), (.noData, .noData):
            return true
        case let (.custom(lhsError), .custom(rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}
