//
//  Service.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

protocol Servicing {
    func fetchQuestion(completionHandler: @escaping(Result<Question, APIError>) -> Void)
    func postAnswer(id: Int, answer: String, completionHandler: @escaping(Result<Answer, APIError>) -> Void)
}

final class Service: Servicing {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchQuestion(completionHandler: @escaping(Result<Question, APIError>) -> Void) {
        let url = DynamoxAPI.getQuestion.url

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(.custom(error)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.wrongData))
                return
            }

            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                completionHandler(.success(question))
            } catch let error {
                completionHandler(.failure(.custom(error)))
            }
        }.resume()
    }

    func postAnswer(id: Int,
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

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(.custom(error)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.wrongData))
                return
            }

            do {
                let answer = try JSONDecoder().decode(Answer.self, from: data)
                completionHandler(.success(answer))
            } catch let error {
                completionHandler(.failure(.custom(error)))
            }
        }.resume()
    }
}
