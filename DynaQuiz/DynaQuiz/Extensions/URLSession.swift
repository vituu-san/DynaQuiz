//
//  URLSession.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
