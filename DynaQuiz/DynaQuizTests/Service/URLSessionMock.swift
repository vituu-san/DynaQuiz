//
//  URLSessionMock.swift
//  DynaQuizTests
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

@testable import DynaQuiz

final class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var error: APIError?

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, nil, self.error)
        }
    }
}

final class URLSessionDataTaskMock: URLSessionDataTask {
    var closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
