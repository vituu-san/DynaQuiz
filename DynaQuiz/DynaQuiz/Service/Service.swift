//
//  Service.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

protocol Servicing {
    func fetchQuestion(completionHandler: @escaping(Result<Question, APIError>) -> Void)
    func postAnswer(id: String,
                    answer: String,
                    completionHandler: @escaping(Result<Answer, APIError>) -> Void)
}

final class Service: Servicing {

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchQuestion(completionHandler: @escaping(Result<Question, APIError>) -> Void) {
        let url = DynamoxAPI.getQuestion.url

        makeRequest(url: url, completionHandler: completionHandler)
    }

    func postAnswer(id: String,
                    answer: String,
                    completionHandler: @escaping(Result<Answer, APIError>) -> Void) {
        let url = DynamoxAPI.postAnswer(id: id).url

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20

        guard let body = try? JSONSerialization.data(withJSONObject: ["answer": answer], options: []) else {
            return
        }

        request.httpBody = body

        makeRequest(url: url, completionHandler: completionHandler)
    }

    private func makeRequest<T: Codable>(url: URL,
                                         completionHandler: @escaping(Result<T, APIError>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(.custom(NSError(domain: error.localizedDescription, code: 0))))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }

            do {
                let answer = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(answer))
            } catch {
                completionHandler(.failure(.wrongData))
            }
        }.resume()
    }
}
