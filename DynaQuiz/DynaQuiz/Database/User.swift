//
//  User.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import Foundation
import RealmSwift

public class ObjectData: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
}

public final class User: ObjectData, Codable {
    @Persisted var name: String = ""
    @Persisted var score: Int = 0

    convenience init(name: String, score: Int) {
        self.init()
        self.name = name
        self.score = score
    }

    static var placeholder: User {
        User(name: "", score: 0)
    }
}
