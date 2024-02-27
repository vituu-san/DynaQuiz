//
//  ViewModel.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

final class ViewModel {
    private let service = Service()

    init() {
        test()
    }

    func test() {
        service.fetchQuestion { result in
            switch result {
            case .success(let question):
                print(question)
            case .failure(let error):
                print(error)
            }

        }
    }
}
