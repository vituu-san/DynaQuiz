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
    case custom(Error)
}
