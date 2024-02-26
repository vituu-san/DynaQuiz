//
//  RawRepresentable.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 26/02/24.
//

import Foundation

extension RawRepresentable where RawValue == String, Self: API {
    var url: URL { Self.baseURL.appendingPathComponent(rawValue) }

    init?(rawValue: Self.RawValue) { nil }
}


public protocol RawRepresentable {

    associatedtype RawValue

    init?(rawValue: Self.RawValue)

    var rawValue: Self.RawValue { get }
}
