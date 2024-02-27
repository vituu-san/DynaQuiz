//
//  DatabaseManager.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import RealmSwift

protocol DatabaseProtocol: AnyObject {
    var realm: Realm { get set }

    func create<T: Object>(_ object: T) throws
    func all<T: Object>(of object: T.Type) throws -> Results<T>
}

extension DatabaseProtocol {
    func create<T: Object>(_ object: T) throws {
        try realm.write { realm.add(object) }
    }

    func all<T: Object>(of object: T.Type) throws -> Results<T> {
        return realm.objects(T.self)
    }
}

final class Database: DatabaseProtocol {
    var realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }
}
