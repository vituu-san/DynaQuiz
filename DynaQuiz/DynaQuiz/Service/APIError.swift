//
//  APIError.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

enum APIError: Error {
    case server
    case wrongData
    case noData
    case custom(NSError)

    var rawValue: String {
        switch self {
        case .server: return "Couldn't connect to server!"
        case .wrongData: return "Couldn't decode data!"
        case .noData: return "Couldn't read data!"
        case .custom(let error): return error.localizedDescription
        }
    }
}
