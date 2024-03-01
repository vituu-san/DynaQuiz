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

    init(session: URLSessionProtocol) {
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

        makeRequest(url: url, params: ["answer" : answer], completionHandler: completionHandler)
    }

    private func makeRequest<T: Codable>(url: URL,
                                         params: [String: Any]? = nil,
                                         completionHandler: @escaping(Result<T, APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = params != nil ? "POST" : "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20

        guard let body = try? JSONSerialization.data(withJSONObject: params ?? [:], options: []) else {
            return
        }

        request.httpBody = params != nil ? body : nil

        session.dataTask(with: request) { data, _, error in

            if let error = error {
                completionHandler(.failure(.custom(NSError(domain: error.localizedDescription, code: 0))))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }

            DispatchQueue.main.async {
                do {
                    let answer = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(answer))
                } catch {
                    completionHandler(.failure(.wrongData))
                }
            }
        }.resume()
    }
}
